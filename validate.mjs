import fs from "node:fs";
const html = fs.readFileSync("dist/index.html", "utf8");
const match = html.match(/<script>([\s\S]*?)<\/script>/);
if (!match) throw new Error("missing script");
new Function(match[1]);
if (!html.includes('id="questList"') || !html.includes("pink-study-quest-v1")) {
  throw new Error("missing core UI");
}
console.log(JSON.stringify({ htmlBytes: Buffer.byteLength(html), scriptSyntax: "ok", coreUi: "ok" }));
