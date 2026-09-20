import fs from "node:fs";
const html = fs.readFileSync("dist/index.html", "utf8");
const script = fs.readFileSync("dist/app.js", "utf8");
const privacy = fs.readFileSync("dist/privacy.html", "utf8");
const terms = fs.readFileSync("dist/terms.html", "utf8");
new Function(script);
if (!html.includes('id="questMatrix"') || !html.includes('id="googleSignIn"') || !html.includes('id="settingsDialog"')) {
  throw new Error("missing core UI");
}
if (!privacy.includes("隱私權政策") || !terms.includes("服務條款")) throw new Error("missing policy pages");
if (!script.includes("function moveTask") || !script.includes("function openTaskEditor") || !script.includes("function wireTaskCards")) {
  throw new Error("missing task board interactions");
}
if (!html.includes('id="questSubmitButton"') || !html.includes('name="editId"')) throw new Error("missing task editor UI");
console.log(JSON.stringify({ htmlBytes: Buffer.byteLength(html), scriptBytes: Buffer.byteLength(script), scriptSyntax: "ok", coreUi: "ok", taskEditing: "ok", dragAndDrop: "ok" }));
