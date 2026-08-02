"use client";

import { FormEvent, useEffect, useRef, useState } from "react";

type Row = Record<string, unknown>;
type Answer = { intent: string; interpretation: string; answer: string; results: Row[]; result_count: number; graph: { nodes: {id:string;label:string;type:string}[]; edges: {source:string;target:string;label:string}[] } };
type Message = { role: "user" | "assistant"; text: string; payload?: Answer; error?: boolean };

const examples = [
  "What engineering careers can I explore?",
  "Can a commerce student enter fintech?",
  "Which careers combine law and technology?",
  "What qualifications are needed for a psychologist?",
  "Show entrance exams related to management",
];

export default function Home() {
  const [question, setQuestion] = useState("");
  const [messages, setMessages] = useState<Message[]>([{ role:"assistant", text:"Hello. I’m the RSA Career Guide. Tell me what you study, what interests you, or a career you are considering." }]);
  const [busy, setBusy] = useState(false);
  const [health, setHealth] = useState<{status:string;streams?:number;error?:string}>({status:"checking"});
  const endRef = useRef<HTMLDivElement>(null);

  useEffect(() => { fetch("/api/health").then(async r => setHealth(await r.json())).catch(() => setHealth({status:"setup_required",error:"Application server is unavailable."})); }, []);
  useEffect(() => endRef.current?.scrollIntoView({ behavior:"smooth" }), [messages, busy]);

  async function ask(event?: FormEvent, suggested?: string) {
    event?.preventDefault();
    const text = (suggested || question).trim();
    if (!text || busy) return;
    setQuestion(""); setBusy(true); setMessages(current => [...current, { role:"user", text }]);
    try {
      const response = await fetch("/api/ask", { method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify({question:text}) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "The question could not be answered.");
      setMessages(current => [...current, { role:"assistant", text:data.answer, payload:data }]);
    } catch (error) {
      setMessages(current => [...current, { role:"assistant", text:error instanceof Error ? error.message : "The question could not be answered.", error:true }]);
    } finally { setBusy(false); }
  }

  return <main className="chatApp">
    <header className="chatHeader">
      <div className="identity"><span className="logo">R</span><div><strong>RSA Career Guide</strong><small>Evidence-backed career intelligence</small></div></div>
      <div className={`health ${health.status}`}><i/>{health.status === "ready" ? `${Number(health.streams||0).toLocaleString()} pathways ready` : health.status === "checking" ? "Checking graph" : "Setup required"}</div>
    </header>

    <section className="chatShell">
      <aside className="contextPanel">
        <p className="kicker">KNOWLEDGE, NOT GUESSWORK</p>
        <h1>Explore your future through a connected career graph.</h1>
        <p className="intro">Ask naturally. The guide interprets your question, searches governed pathways in Neo4j, and explains what the evidence supports.</p>
        <div className="trustGrid"><div><b>6</b><span>career universes</span></div><div><b>Live</b><span>graph reasoning</span></div><div><b>Source</b><span>confidence shown</span></div></div>
        <div className="process"><span>HOW AN ANSWER IS BUILT</span><ol><li>Understand your intent</li><li>Extract subjects and careers</li><li>Run an approved graph query</li><li>Explain verified results</li></ol></div>
      </aside>

      <section className="conversation">
        {health.status === "setup_required" && <div className="setupAlert"><strong>Connect the local knowledge graph</strong><span>{health.error}</span><code>Copy .env.example to .env.local, enter the Neo4j password, then restart the website.</code></div>}
        <div className="messages">
          {messages.map((message,index) => <article key={index} className={`message ${message.role} ${message.error ? "error" : ""}`}>
            <div className="avatar">{message.role === "assistant" ? "R" : "You"}</div>
            <div className="bubble"><p>{message.text}</p>{message.payload && <AnswerDetails answer={message.payload}/>}</div>
          </article>)}
          {busy && <article className="message assistant"><div className="avatar">R</div><div className="bubble thinking"><span/><span/><span/><em>Reading the career graph…</em></div></article>}
          <div ref={endRef}/>
        </div>

        {messages.length < 3 && <div className="suggestions">{examples.map(example => <button key={example} onClick={() => ask(undefined,example)}>{example}<span>↗</span></button>)}</div>}
        <form className="composer" onSubmit={ask}><textarea value={question} onChange={e=>setQuestion(e.target.value)} onKeyDown={e=>{if(e.key==="Enter"&&!e.shiftKey){e.preventDefault();ask();}}} placeholder="Ask about careers, eligibility, subjects, exams or interdisciplinary paths…" rows={2}/><button disabled={busy || question.trim().length<3} aria-label="Ask the career graph">Ask <span>→</span></button><small>Answers reflect the knowledge graph and its current evidence status.</small></form>
      </section>
    </section>
  </main>;
}

function AnswerDetails({answer}:{answer:Answer}) {
  const [view,setView] = useState<"cards"|"graph">("cards");
  if (!answer.results.length) return <div className="answerMeta"><span>{answer.interpretation}</span></div>;
  return <div className="answerDetails">
    <div className="answerMeta"><span>{answer.interpretation}</span><b>{answer.result_count} graph matches</b></div>
    <div className="viewTabs"><button className={view==="cards"?"active":""} onClick={()=>setView("cards")}>Pathways</button><button className={view==="graph"?"active":""} onClick={()=>setView("graph")}>Graph view</button></div>
    {view === "cards" ? <div className="resultCards">{answer.results.slice(0,8).map((row,i)=><div className="resultCard" key={i}><strong>{String(row.career || row.pathway || row.exam || row.universe || row.entity_type || "Graph result")}</strong>{row.pathway && row.career !== row.pathway && <span>{String(row.pathway)}</span>}<dl>{Object.entries(row).filter(([key,value])=>value!=null && !["career","pathway"].includes(key)).slice(0,5).map(([key,value])=><div key={key}><dt>{key.replaceAll("_"," ")}</dt><dd>{display(value)}</dd></div>)}</dl></div>)}</div> : <GraphPreview graph={answer.graph}/>} 
  </div>;
}

function GraphPreview({graph}:{graph:Answer["graph"]}) {
  const nodes=graph.nodes.slice(0,16);
  return <div className="miniGraph">{nodes.map((node,i)=><div key={node.id} className={`miniNode ${node.type.toLowerCase()}`}><small>{node.type}</small><b>{node.label}</b>{i<nodes.length-1&&<span>→</span>}</div>)}</div>;
}

function display(value:unknown) {
  if (value === null || value === undefined || value === "") return "Not available";
  if (typeof value === "object") return JSON.stringify(value);
  return String(value);
}
