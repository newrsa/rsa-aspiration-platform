"use client";

import { FormEvent, useEffect, useRef, useState } from "react";

type Row = Record<string, unknown>;
type Persona = "aspirant" | "leader";
type Answer = { persona?:Persona; intent: string; interpretation: string; answer: string; results: Row[]; result_count: number; graph: { nodes: {id:string;label:string;type:string}[]; edges: {source:string;target:string;label:string}[] } };
type Message = { role: "user" | "assistant"; text: string; payload?: Answer; error?: boolean };

const examples:Record<Persona,string[]> = {
  aspirant:["What engineering careers can I explore?","Can a commerce student enter fintech?","Which careers combine law and technology?","What qualifications are needed for a psychologist?"],
  leader:["What is inside the Commerce universe?","Compare all universe coverage","Show the largest domains","Show ontology and data maturity","Which entrance exams are represented?","What is populated in the backend?","Run a structural data-quality check"],
};

export default function Home() {
  const [question, setQuestion] = useState("");
  const [persona,setPersona] = useState<Persona>("aspirant");
  const [messages, setMessages] = useState<Message[]>([{ role:"assistant", text:"Hello. I’m the RSA Career Guide. Tell me what you study, what interests you, or a career you are considering." }]);
  const [busy, setBusy] = useState(false);
  const [health, setHealth] = useState<{status:string;streams?:number;error?:string}>({status:"checking"});
  const endRef = useRef<HTMLDivElement>(null);

  useEffect(() => { void fetch("/api/health").then(async r => setHealth(await r.json())).catch(() => setHealth({status:"setup_required",error:"Application server is unavailable."})); }, []);
  useEffect(() => { endRef.current?.scrollIntoView({ behavior:"smooth" }); }, [messages, busy]);

  async function ask(event?: FormEvent, suggested?: string) {
    event?.preventDefault();
    const text = (suggested || question).trim();
    if (!text || busy) return;
    setQuestion(""); setBusy(true); setMessages(current => [...current, { role:"user", text }]);
    try {
      const response = await fetch("/api/ask", { method:"POST", headers:{"Content-Type":"application/json"}, body:JSON.stringify({question:text,persona}) });
      const data = await response.json();
      if (!response.ok) throw new Error(data.error || "The question could not be answered.");
      setMessages(current => [...current, { role:"assistant", text:data.answer, payload:data }]);
    } catch (error) {
      setMessages(current => [...current, { role:"assistant", text:error instanceof Error ? error.message : "The question could not be answered.", error:true }]);
    } finally { setBusy(false); }
  }

  return <main className="chatApp">
    <header className="chatHeader">
      <div className="identity"><span className="wordmark">RSA</span><div><strong>Knowledge Guide</strong><small>{persona==="leader"?"Backend and universe intelligence":"Evidence-backed career guidance"}</small></div></div>
      <div className="headerTools"><div className="personaSwitch" aria-label="Choose answer mode"><button className={persona==="aspirant"?"active":""} onClick={()=>switchPersona("aspirant")}>Aspirant</button><button className={persona==="leader"?"active":""} onClick={()=>switchPersona("leader")}>Leader</button></div><div className={`health ${health.status}`}><i/>{health.status === "ready" ? `${Number(health.streams||0).toLocaleString()} pathways ready` : health.status === "checking" ? "Checking graph" : "Setup required"}</div></div>
    </header>

    <section className="chatShell">
      <aside className="contextPanel">
        <p className="kicker">{persona==="leader"?"LEADERSHIP VIEW":"ASPIRANT VIEW"}</p>
        <h1>{persona==="leader"?"Understand what is inside the knowledge graph.":"Explore your future through connected evidence."}</h1>
        <p className="intro">{persona==="leader"?"Ask about any universe, backend entities, governance, traceability or data quality. Answers expose live counts and maturity without requiring Cypher.":"Ask about careers, eligibility, examinations or cross-domain routes. Answers are ranked from governed Neo4j records and disclose evidence gaps."}</p>
        <div className="trustGrid"><div><b>6</b><span>universes</span></div><div><b>Live</b><span>Neo4j reasoning</span></div><div><b>Clear</b><span>evidence limits</span></div></div>
      </aside>

      <section className="conversation">
        {health.status === "setup_required" && <div className="setupAlert"><strong>Connect the local knowledge graph</strong><span>{health.error}</span><code>Copy .env.example to .env.local, enter the Neo4j password, then restart the website.</code></div>}
        <div className="messages">
          {messages.map((message,index) => <article key={index} className={`message ${message.role} ${message.error ? "error" : ""}`}>
            <div className="avatar">{message.role === "assistant" ? "RSA" : "YOU"}</div>
            <div className="bubble"><p>{message.text}</p>{message.payload && <AnswerDetails answer={message.payload}/>}</div>
          </article>)}
          {busy && <article className="message assistant"><div className="avatar">RSA</div><div className="bubble thinking"><span/><span/><span/><em>Reading the knowledge base…</em></div></article>}
          <div ref={endRef}/>
        </div>

        {messages.length < 3 && <div className="suggestions">{examples[persona].map(example => <button key={example} onClick={() => ask(undefined,example)}>{example}<span>↗</span></button>)}</div>}
        <form className="composer" onSubmit={ask}><textarea value={question} onChange={e=>setQuestion(e.target.value)} onKeyDown={e=>{if(e.key==="Enter"&&!e.shiftKey){e.preventDefault();ask();}}} placeholder={persona==="leader"?"Ask what is inside a universe, how data is governed, or what is populated…":"Ask about careers, eligibility, subjects, exams or interdisciplinary paths…"} rows={2}/><button disabled={busy || question.trim().length<3} aria-label="Ask the knowledge graph">Ask <span>→</span></button><small>{persona==="leader"?"Leadership mode exposes backend structure but remains read-only.":"Answers reflect governed graph knowledge and state evidence gaps explicitly."}</small></form>
      </section>
    </section>
  </main>;

  function switchPersona(next:Persona){setPersona(next);setQuestion("");setMessages([{role:"assistant",text:next==="leader"?"Leadership mode is ready. Ask what is inside any universe, how the backend is structured, or where evidence gaps remain.":"Aspirant mode is ready. Tell me what you study, what interests you, or a career you are considering."}]);}
}

function AnswerDetails({answer}:{answer:Answer}) {
  if (!answer.results.length) return <div className="answerMeta"><span>{answer.interpretation}</span></div>;
  if(answer.persona==="leader") return <LeaderDetails answer={answer}/>;
  return <div className="answerDetails">
    <div className="answerMeta"><span>{answer.interpretation}</span><b>{answer.result_count} graph matches</b></div>
    <div className="resultCards">{answer.results.slice(0,8).map((row,i)=><div className="resultCard" key={i}><strong>{String(row.career || row.pathway || row.exam || row.universe || row.entity_type || "Knowledge result")}</strong>{row.pathway && row.career !== row.pathway && <span>{String(row.pathway)}</span>}<dl>{Object.entries(row).filter(([key,value])=>value!=null && !["career","pathway","relevance"].includes(key)).slice(0,7).map(([key,value])=><div key={key}><dt>{key.replaceAll("_"," ")}</dt><dd>{display(value)}</dd></div>)}</dl></div>)}</div>
  </div>;
}

function LeaderDetails({answer}:{answer:Answer}) {
  return <div className="answerDetails leaderDetails">
    <div className="answerMeta"><span>{answer.interpretation}</span><b>Live backend result</b></div>
    <div className="leaderGrid">{answer.results.slice(0,25).map((row,i)=>{
      const title=String(row.universe||row.domain||row.entity_type||row.exam||"Live integrity result");
      const entries=Object.entries(row).filter(([key,value])=>value!=null&&!["universe","domain","entity_type","exam"].includes(key));
      return <section className="leaderCard" key={i}><div className="leaderCardHead"><span>{answer.intent.replaceAll("_"," ")}</span><strong>{title}</strong></div><dl>{entries.map(([key,value])=><div key={key}><dt>{key.replaceAll("_"," ")}</dt><dd className={typeof value==="number"?"number":""}>{display(value)}</dd></div>)}</dl></section>;
    })}</div>
  </div>;
}

function display(value:unknown) {
  if (value === null || value === undefined || value === "") return "Not available";
  if (typeof value === "object") return JSON.stringify(value);
  return String(value);
}
