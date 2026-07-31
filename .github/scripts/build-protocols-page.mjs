// Renders CEaL_training_material/ROV_protocols.md into a standalone webpage in _site/,
// using github-slugger (via marked-gfm-heading-id) so heading anchors match the
// #anchor-links already written into the markdown's own Table of Contents.
import { readFile, writeFile, mkdir, cp } from "node:fs/promises";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { Marked } from "marked";
import { gfmHeadingId } from "marked-gfm-heading-id";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const repoRoot = path.resolve(__dirname, "..", "..");
const docsDir = path.join(repoRoot, "CEaL_training_material");
const srcFile = path.join(docsDir, "ROV_protocols.md");
const outDir = path.join(repoRoot, "_site");

const marked = new Marked();
marked.use(gfmHeadingId());
marked.setOptions({ gfm: true });

const markdown = await readFile(srcFile, "utf8");
const body = marked.parse(markdown);

const html = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ROV Protocols — Seattle Aquarium</title>
<style>
  :root { color-scheme: light dark; }
  body {
    font-family: -apple-system, "Segoe UI", Helvetica, Arial, sans-serif;
    max-width: 860px;
    margin: 0 auto;
    padding: 2rem 1.25rem 4rem;
    line-height: 1.6;
  }
  img { max-width: 100%; height: auto; }
  h1, h2, h3, h4 { scroll-margin-top: 1rem; }
  h2 { border-bottom: 1px solid #8884; padding-bottom: .3rem; margin-top: 2.5rem; }
  code { background: #8882; padding: .1em .35em; border-radius: 4px; }
  table { border-collapse: collapse; }
  td, th { border: 1px solid #8884; padding: .4em .7em; }
  .source-note { font-size: .85rem; opacity: .7; margin-bottom: 2rem; }
</style>
</head>
<body>
${body}
</body>
</html>
`;

await mkdir(outDir, { recursive: true });
await writeFile(path.join(outDir, "index.html"), html, "utf8");

// Copy the assets ROV_protocols.md links to via relative paths, preserving those paths.
await cp(path.join(docsDir, "photos", "figs"), path.join(outDir, "photos", "figs"), { recursive: true });
await cp(path.join(docsDir, "supplemental_materials"), path.join(outDir, "supplemental_materials"), { recursive: true });

console.log("Built", path.join(outDir, "index.html"));
