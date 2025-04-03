// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import OpenAI from "jsr:@openai/openai";
import "jsr:@supabase/functions-js/edge-runtime.d.ts";

const openai = new OpenAI({
  apiKey: Deno.env.get("OPENAI_API_KEY")!,
});

Deno.serve(async (req) => {
  const { base64Image, mimeType } = await req.json();

  if (!base64Image || !mimeType) {
    return new Response(
      JSON.stringify({ error: "Missing image data or mimeType" }),
      {
        status: 400,
      },
    );
  }

  console.log("Moderating image:", mimeType);

  const dataUri = `data:${mimeType};base64,${base64Image}`;

  const moderation = await openai.moderations.create({
    model: "omni-moderation-latest",
    input: [
      {
        type: "image_url",
        image_url: {
          url: dataUri,
        },
      },
    ],
  });

  console.log("Moderation result:", moderation);

  const flagged = moderation.results.some((res) =>
    res.flagged || res.category_scores["sexual"] > 0.01 //TODO: Change this threshold to a more appropriate value
  );

  const reasons: string[] = moderation.results
    ?.flatMap((res) =>
      Object.entries(res.categories || {})
        .filter(([_, flagged]) => flagged)
        .map(([key]) => key)
    ) || [];

  return new Response(
    JSON.stringify({
      safe: !flagged,
      ...(flagged ? { reasons } : {}),
    }),
    { status: 200 },
  );
});

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/moderate-image' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
