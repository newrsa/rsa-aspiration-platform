import { NextResponse } from "next/server";
import { friendlyGraphError, runGraphQuery } from "../../../lib/neo4j";

export async function GET() {
  try {
    const result = await runGraphQuery("MATCH (s:Stream) RETURN count(s) AS streams");
    return NextResponse.json({ status: "ready", streams: result.rows[0]?.streams || 0 });
  } catch (error) {
    return NextResponse.json({ status: "setup_required", error: friendlyGraphError(error) }, { status: 503 });
  }
}
