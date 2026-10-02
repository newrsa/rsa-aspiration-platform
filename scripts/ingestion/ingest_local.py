#!/usr/bin/env python3
"""Extract approved local documents into citation-preserving RSA evidence files.

Source content is always treated as untrusted data. This program extracts text,
classifies it with deterministic rules, and proposes ontology links. It never
executes source instructions and never mutates canonical ontology data.
"""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import re
import sys
import unicodedata
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Iterable, Iterator


ROOT = Path(__file__).resolve().parents[2]
PIPELINE_VERSION = "0.1.0"

CATEGORY_KEYWORDS = {
    "policy_and_regulation": (
        "policy", "regulation", "regulatory", "guideline", "governance",
        "accreditation", "standard-setting", "ministry", "commission",
    ),
    "education_pathways": (
        "education stage", "pathway", "curriculum", "programme", "program",
        "undergraduate", "postgraduate", "bachelor", "master", "school education",
        "higher education", "multiple entry", "multiple exit",
    ),
    "credits_and_qualifications": (
        "credit framework", "credit level", "credit accumulation", "credit transfer",
        "academic bank of credits", "qualification", "diploma", "degree", "certificate",
    ),
    "skills_and_vocational": (
        "skill", "skilling", "vocational", "apprenticeship", "internship",
        "competency", "competence", "experiential learning", "job role",
    ),
    "certifications_and_licensing": (
        "certification", "certificate", "licence", "license", "professional level",
    ),
    "exams_and_admissions": (
        "entrance exam", "entrance examination", "admission", "eligibility",
        "assessment", "national common entrance test", "nta",
    ),
    "institutions_and_accreditation": (
        "institution", "university", "college", "accreditation", "ugc", "aicte",
        "higher education institution", "hei",
    ),
    "careers_and_employability": (
        "career", "employability", "employment", "occupation", "industry",
        "employer", "work experience", "job market",
    ),
    "scholarships_and_finance": (
        "scholarship", "financial aid", "education loan", "stipend", "fellowship",
    ),
    "labour_market": (
        "labour market", "labor market", "workforce", "employment forecast",
        "future of work", "job demand",
    ),
}

ENTITY_FILE_MAP = {
    "activity": "Activity",
    "admissionpathway": "AdmissionPathway",
    "apprenticeship": "Apprenticeship",
    "aptitude": "Aptitude",
    "careeroutcome": "CareerOutcome",
    "career_outcomes": "CareerOutcome",
    "certification": "Certification",
    "city": "City",
    "criterion": "Criterion",
    "decisionpoint": "DecisionPoint",
    "degree": "Degree",
    "degrees": "Degree",
    "domain": "Domain",
    "domains": "Domain",
    "educationloan": "EducationLoan",
    "educationstage": "EducationStage",
    "entranceexam": "EntranceExam",
    "entrance_exams": "EntranceExam",
    "faculty": "Faculty",
    "institution": "Institution",
    "institutions": "Institution",
    "institutiontype": "InstitutionType",
    "interest": "Interest",
    "internshiptype": "InternshipType",
    "licence": "Licence",
    "personalitytrait": "PersonalityTrait",
    "project": "Project",
    "regulatorybody": "RegulatoryBody",
    "salaryrange": "SalaryRange",
    "scholarship": "Scholarship",
    "skill": "Skill",
    "skills": "Skill",
    "stream": "Stream",
    "streams": "Stream",
    "subject": "Subject",
    "subjectcombination": "SubjectCombination",
    "subjectequivalencerule": "SubjectEquivalenceRule",
    "subjectlevel": "SubjectLevel",
    "syllabustopic": "SyllabusTopic",
    "workpreference": "WorkPreference",
}

GENERIC_TERMS = {
    "activity", "career", "certificate", "city", "criterion", "degree", "domain",
    "education", "faculty", "institution", "interest", "project", "science", "skill",
    "stream", "subject", "technology", "training", "work", "policy", "language", "data",
    "history", "philosophy", "business", "ethics", "geography", "psychology", "sociology",
}

ENTITY_CONTEXT_TERMS = {
    "Skill": ("skill", "competency", "competence", "proficiency", "vocational", "module"),
    "CareerOutcome": ("career", "job", "occupation", "role", "employment", "employability"),
    "EducationStage": ("stage", "school", "education", "undergraduate", "postgraduate", "grade"),
    "EntranceExam": ("exam", "examination", "test", "admission", "eligibility"),
    "Degree": ("degree", "diploma", "programme", "program", "qualification", "award"),
    "Institution": ("institution", "university", "college", "institute", "hei"),
    "RegulatoryBody": ("regulatory", "commission", "council", "ministry", "authority", "body"),
    "Certification": ("certification", "certificate", "assessment", "credential"),
    "Subject": ("subject", "curriculum", "course", "discipline"),
    "Stream": ("stream", "discipline", "pathway", "specialisation", "specialization"),
}


@dataclass(frozen=True)
class Segment:
    locator_type: str
    locator_start: str
    locator_end: str
    text: str


@dataclass(frozen=True)
class OntologyTerm:
    entity_label: str
    reference_property: str
    reference_code: str
    name: str
    normalized_name: str


def utc_now() -> str:
    return datetime.now(timezone.utc).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def stable_id(prefix: str, *parts: str, length: int = 20) -> str:
    digest = sha256_bytes("\x1f".join(parts).encode("utf-8"))[:length].upper()
    return f"{prefix}-{digest}"


def normalize_text(text: str) -> str:
    text = unicodedata.normalize("NFKC", text)
    text = text.replace("\x00", " ").replace("\u00ad", "")
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\s*\n\s*", "\n", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def normalized_match_text(text: str) -> str:
    text = unicodedata.normalize("NFKC", text).casefold()
    return re.sub(r"[^a-z0-9+.#&]+", " ", text).strip()


def split_words(text: str, target_words: int, overlap_words: int) -> list[str]:
    words = text.split()
    if len(words) <= target_words:
        return [text] if text else []
    chunks: list[str] = []
    start = 0
    while start < len(words):
        end = min(start + target_words, len(words))
        chunks.append(" ".join(words[start:end]))
        if end == len(words):
            break
        start = max(end - overlap_words, start + 1)
    return chunks


def extract_pdf(path: Path, target_words: int, overlap_words: int) -> tuple[list[Segment], dict]:
    try:
        from pypdf import PdfReader
    except ImportError as exc:
        raise RuntimeError("Install ingestion/requirements.txt before extracting PDFs") from exc

    reader = PdfReader(str(path))
    segments: list[Segment] = []
    low_text_pages: list[int] = []
    for page_number, page in enumerate(reader.pages, start=1):
        text = normalize_text(page.extract_text() or "")
        if len(text) < 40:
            low_text_pages.append(page_number)
        for part in split_words(text, target_words, overlap_words):
            if len(part.split()) >= 8:
                segments.append(Segment("page", str(page_number), str(page_number), part))
    metadata = {
        "page_count": len(reader.pages),
        "low_text_pages": low_text_pages,
        "pdf_metadata": {str(k).lstrip("/"): str(v) for k, v in (reader.metadata or {}).items()},
    }
    return segments, metadata


def parse_timestamp(value: str) -> str:
    value = value.strip().replace(",", ".")
    return value


def extract_timed_transcript(path: Path, target_words: int) -> tuple[list[Segment], dict]:
    raw = path.read_text(encoding="utf-8-sig", errors="replace")
    cue_pattern = re.compile(
        r"(?ms)(?:^\d+\s*\n)?"
        r"(?P<start>\d{1,2}:\d{2}:\d{2}[,.]\d{3})\s*-->\s*"
        r"(?P<end>\d{1,2}:\d{2}:\d{2}[,.]\d{3})[^\n]*\n"
        r"(?P<text>.*?)(?=\n\s*\n|\Z)"
    )
    cues = [
        (parse_timestamp(m.group("start")), parse_timestamp(m.group("end")),
         normalize_text(re.sub(r"<[^>]+>", " ", m.group("text"))))
        for m in cue_pattern.finditer(raw)
    ]
    segments: list[Segment] = []
    bucket: list[str] = []
    bucket_start = ""
    bucket_end = ""
    word_count = 0
    for start, end, text in cues:
        if not text:
            continue
        if not bucket:
            bucket_start = start
        bucket.append(text)
        bucket_end = end
        word_count += len(text.split())
        if word_count >= target_words:
            segments.append(Segment("timestamp", bucket_start, bucket_end, " ".join(bucket)))
            bucket, word_count = [], 0
    if bucket:
        segments.append(Segment("timestamp", bucket_start, bucket_end, " ".join(bucket)))
    return segments, {"cue_count": len(cues)}


def extract_plain_text(path: Path, target_words: int, overlap_words: int) -> tuple[list[Segment], dict]:
    text = normalize_text(path.read_text(encoding="utf-8-sig", errors="replace"))
    parts = split_words(text, target_words, overlap_words)
    return [Segment("section", str(i), str(i), part) for i, part in enumerate(parts, 1)], {}


def extract_file(path: Path, target_words: int, overlap_words: int) -> tuple[list[Segment], dict]:
    suffix = path.suffix.casefold()
    if suffix == ".pdf":
        return extract_pdf(path, target_words, overlap_words)
    if suffix in {".srt", ".vtt"}:
        return extract_timed_transcript(path, target_words)
    if suffix in {".txt", ".md"}:
        return extract_plain_text(path, target_words, overlap_words)
    raise ValueError(f"Unsupported local source type: {path.suffix}")


def classify(text: str, defaults: Iterable[str]) -> list[str]:
    haystack = normalized_match_text(text)
    categories = set(defaults)
    for category, terms in CATEGORY_KEYWORDS.items():
        if any(normalized_match_text(term) in haystack for term in terms):
            categories.add(category)
    return sorted(categories)


def infer_reference_fields(headers: list[str]) -> tuple[str | None, str | None]:
    code = next((h for h in headers if h.endswith("_code")), None)
    name = next((h for h in ("name", "display_name", "title", "short_name") if h in headers), None)
    return code, name


def load_ontology_terms() -> list[OntologyTerm]:
    sources = [ROOT / "datasets" / "seed" / "nodes", ROOT / "knowledge-graph" / "data"]
    terms: dict[tuple[str, str], OntologyTerm] = {}
    for directory in sources:
        if not directory.exists():
            continue
        for path in sorted(directory.glob("*.csv")):
            label = ENTITY_FILE_MAP.get(path.stem)
            if not label:
                continue
            with path.open(encoding="utf-8-sig", newline="") as stream:
                reader = csv.DictReader(stream)
                headers = reader.fieldnames or []
                code_field, name_field = infer_reference_fields(headers)
                if not code_field or not name_field:
                    continue
                for row in reader:
                    code = (row.get(code_field) or "").strip()
                    name = (row.get(name_field) or "").strip()
                    normalized = normalized_match_text(name)
                    if not code or not name or len(normalized) < 4:
                        continue
                    if normalized in GENERIC_TERMS:
                        continue
                    terms[(label, code)] = OntologyTerm(label, code_field, code, name, normalized)
    return sorted(terms.values(), key=lambda item: (-len(item.normalized_name), item.entity_label, item.reference_code))


def propose_links(chunk: dict, terms: list[OntologyTerm], expected_labels: set[str]) -> list[dict]:
    haystack = f" {normalized_match_text(chunk['text'])} "
    found: list[dict] = []
    for term in terms:
        if expected_labels and term.entity_label not in expected_labels:
            continue
        needle = f" {term.normalized_name} "
        position = haystack.find(needle)
        if position < 0:
            continue
        window = haystack[max(0, position - 220): position + len(needle) + 220]
        context_terms = ENTITY_CONTEXT_TERMS.get(term.entity_label, ())
        if context_terms and not any(normalized_match_text(value) in window for value in context_terms):
            continue
        # Single-token labels are unusually ambiguous in policy prose. Keep only
        # substantial terms with explicit entity context; acronyms remain eligible.
        if " " not in term.normalized_name and len(term.normalized_name) < 7 and not term.name.isupper():
            continue
        confidence = 0.92 if " " in term.normalized_name else 0.86
        candidate_id = stable_id("LNK", chunk["chunk_id"], term.entity_label, term.reference_code)
        found.append({
            "candidate_id": candidate_id,
            "chunk_id": chunk["chunk_id"],
            "entity_label": term.entity_label,
            "reference_property": term.reference_property,
            "reference_code": term.reference_code,
            "matched_text": term.name,
            "match_method": "deterministic_exact_name",
            "confidence": confidence,
            "review_status": "proposed",
            "reviewer": "",
            "reviewed_at": "",
            "review_rationale": "",
        })
        if len(found) >= 30:
            break
    return found


def write_jsonl(path: Path, rows: Iterable[dict]) -> None:
    with path.open("w", encoding="utf-8", newline="\n") as stream:
        for row in rows:
            stream.write(json.dumps(row, ensure_ascii=False, sort_keys=True) + "\n")


def write_csv(path: Path, fieldnames: list[str], rows: Iterable[dict]) -> None:
    with path.open("w", encoding="utf-8", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--catalog", type=Path, required=True)
    parser.add_argument("--inbox", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--source-id", action="append", help="process only selected source IDs")
    parser.add_argument("--target-words", type=int, default=650)
    parser.add_argument("--overlap-words", type=int, default=80)
    parser.add_argument("--strict", action="store_true", help="fail when a configured local file is missing")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    catalog = json.loads(args.catalog.read_text(encoding="utf-8"))
    selected = set(args.source_id or [])
    output = args.output
    output.mkdir(parents=True, exist_ok=True)
    extracted_at = utc_now()
    run_id = stable_id("RUN", extracted_at, str(args.inbox.resolve()))
    terms = load_ontology_terms()

    documents: list[dict] = []
    chunks: list[dict] = []
    links: list[dict] = []
    skipped: list[dict] = []
    errors: list[dict] = []

    for source in catalog.get("sources", []):
        if selected and source.get("source_id") not in selected:
            continue
        if source.get("kind") not in {"pdf", "transcript", "text"}:
            skipped.append({"source_id": source.get("source_id"), "reason": "not_a_local_document"})
            continue
        path = args.inbox / source["file_name"]
        if not path.is_file():
            item = {"source_id": source["source_id"], "reason": "file_not_found", "file_name": source["file_name"]}
            (errors if args.strict else skipped).append(item)
            continue
        try:
            content_hash = sha256_bytes(path.read_bytes())
            document_id = stable_id("DOC", source["source_id"], content_hash)
            segments, extraction_metadata = extract_file(path, args.target_words, args.overlap_words)
            defaults = source.get("default_categories", [])
            document_categories = sorted(set(defaults).union(*(set(classify(s.text, defaults)) for s in segments)))
            document = {
                "document_id": document_id,
                "source_id": source["source_id"],
                "title": source["title"],
                "source_kind": source["kind"],
                "authority_id": source.get("authority_id", ""),
                "publisher": source.get("publisher", ""),
                "publication_date": source.get("publication_date", ""),
                "canonical_url": source.get("canonical_url", ""),
                "file_name": path.name,
                "content_hash": content_hash,
                "page_count": extraction_metadata.get("page_count", ""),
                "extracted_at": extracted_at,
                "pipeline_version": PIPELINE_VERSION,
                "categories": document_categories,
                "metadata": {
                    "expected_entity_types": source.get("expected_entity_types", []),
                    "extraction": extraction_metadata,
                },
            }
            documents.append(document)
            expected_labels = set(source.get("expected_entity_types", []))
            for index, segment in enumerate(segments, start=1):
                text_hash = sha256_bytes(segment.text.encode("utf-8"))
                chunk_id = stable_id("CHK", document_id, str(index), text_hash)
                chunk = {
                    "chunk_id": chunk_id,
                    "document_id": document_id,
                    "chunk_index": index,
                    "locator_type": segment.locator_type,
                    "locator_start": segment.locator_start,
                    "locator_end": segment.locator_end,
                    "text": segment.text,
                    "text_hash": text_hash,
                    "word_count": len(segment.text.split()),
                    "categories": classify(segment.text, defaults),
                    "language_code": "en",
                    "source_id": source["source_id"],
                    "title": source["title"],
                    "canonical_url": source.get("canonical_url", ""),
                }
                chunks.append(chunk)
                links.extend(propose_links(chunk, terms, expected_labels))
        except Exception as exc:  # retain other sources and report the exact failure
            errors.append({"source_id": source.get("source_id"), "file_name": str(path), "reason": str(exc)})

    write_jsonl(output / "documents.jsonl", documents)
    write_jsonl(output / "chunks.jsonl", chunks)
    write_jsonl(output / "ontology_link_candidates.jsonl", links)

    postgres_documents = []
    for row in documents:
        item = dict(row)
        item["categories"] = json.dumps(row["categories"], ensure_ascii=False)
        item["metadata"] = json.dumps(row["metadata"], ensure_ascii=False)
        postgres_documents.append(item)
    write_csv(output / "postgres_documents.csv", [
        "document_id", "source_id", "title", "source_kind", "authority_id", "publisher",
        "publication_date", "canonical_url", "file_name", "content_hash", "page_count",
        "extracted_at", "pipeline_version", "categories", "metadata",
    ], postgres_documents)

    postgres_chunks = []
    for row in chunks:
        item = dict(row)
        item["text_content"] = row["text"]
        item["categories"] = json.dumps(row["categories"], ensure_ascii=False)
        postgres_chunks.append(item)
    write_csv(output / "postgres_chunks.csv", [
        "chunk_id", "document_id", "chunk_index", "locator_type", "locator_start",
        "locator_end", "text_content", "text_hash", "word_count", "categories", "language_code",
    ], postgres_chunks)
    write_csv(output / "postgres_ontology_link_candidates.csv", [
        "candidate_id", "chunk_id", "entity_label", "reference_property", "reference_code",
        "matched_text", "match_method", "confidence", "review_status", "reviewer", "reviewed_at",
        "review_rationale",
    ], links)

    write_csv(output / "neo4j_documents.csv", [
        "document_id", "source_id", "title", "source_kind", "authority_id", "publisher",
        "publication_date", "canonical_url", "content_hash", "extracted_at", "pipeline_version",
    ], documents)
    neo4j_chunks = []
    for row in chunks:
        item = dict(row)
        item["excerpt"] = row["text"][:700]
        item["categories"] = "|".join(row["categories"])
        neo4j_chunks.append(item)
    write_csv(output / "neo4j_chunks.csv", [
        "chunk_id", "document_id", "chunk_index", "locator_type", "locator_start", "locator_end",
        "excerpt", "text_hash", "categories",
    ], neo4j_chunks)
    write_csv(output / "neo4j_approved_links.csv", [
        "candidate_id", "chunk_id", "entity_label", "reference_property", "reference_code",
        "confidence", "review_status", "reviewer", "reviewed_at",
    ], [row for row in links if row["review_status"] == "approved"])

    report = {
        "run_id": run_id,
        "pipeline_version": PIPELINE_VERSION,
        "extracted_at": extracted_at,
        "catalog_version": catalog.get("version"),
        "documents": len(documents),
        "chunks": len(chunks),
        "ontology_link_candidates": len(links),
        "ontology_terms_considered": len(terms),
        "skipped": skipped,
        "errors": errors,
    }
    (output / "run_report.json").write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(report, indent=2, ensure_ascii=False))
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
