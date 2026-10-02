import importlib.util
import json
import sys
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location(
    "ingest_local", ROOT / "scripts" / "ingestion" / "ingest_local.py"
)
MODULE = importlib.util.module_from_spec(SPEC)
assert SPEC.loader is not None
sys.modules[SPEC.name] = MODULE
SPEC.loader.exec_module(MODULE)


class IngestionTests(unittest.TestCase):
    def test_catalog_has_unique_sources_and_known_categories(self):
        catalog = json.loads((ROOT / "ingestion" / "config" / "source_catalog.json").read_text(encoding="utf-8"))
        source_ids = [row["source_id"] for row in catalog["sources"]]
        self.assertEqual(len(source_ids), len(set(source_ids)))
        known = set(catalog["categories"])
        for source in catalog["sources"]:
            self.assertTrue(set(source.get("default_categories", [])).issubset(known))

    def test_category_classification_is_multi_label(self):
        text = "The Academic Bank of Credits supports vocational skills and employability."
        categories = MODULE.classify(text, [])
        self.assertIn("credits_and_qualifications", categories)
        self.assertIn("skills_and_vocational", categories)
        self.assertIn("careers_and_employability", categories)

    def test_transcript_preserves_timestamp_range(self):
        content = """1
00:00:01,000 --> 00:00:04,000
Students can explore vocational education and practical skills.

2
00:00:04,500 --> 00:00:08,000
These experiences can support future careers and employability.
"""
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "sample.srt"
            path.write_text(content, encoding="utf-8")
            segments, metadata = MODULE.extract_timed_transcript(path, 100)
        self.assertEqual(metadata["cue_count"], 2)
        self.assertEqual(segments[0].locator_start, "00:00:01.000")
        self.assertEqual(segments[0].locator_end, "00:00:08.000")

    def test_stable_ids_are_deterministic(self):
        first = MODULE.stable_id("CHK", "document", "1", "hash")
        second = MODULE.stable_id("CHK", "document", "1", "hash")
        self.assertEqual(first, second)
        self.assertTrue(first.startswith("CHK-"))


if __name__ == "__main__":
    unittest.main()
