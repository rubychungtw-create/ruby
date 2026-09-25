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
if (!html.includes('id="timerDisplay"') || !html.includes('id="timerStartPause"') || !script.includes("function advanceTimer") || !script.includes("function renderTimer")) throw new Error("missing mission timer");
if (!html.includes('id="timerFullscreen"') || !script.includes("function toggleTimerFocus")) throw new Error("missing fullscreen focus timer");
if (!html.includes('id="reflectionForm"') || !html.includes('id="notePhotoInput"') || !script.includes("function saveReflection")) throw new Error("missing daily reflection UI");
if (!html.includes('id="examPanel"') || !html.includes('id="scoreDialog"') || !html.includes('id="scoreChart"') || !script.includes("function saveExamResult") || !script.includes("function renderScoreChart")) throw new Error("missing exam score progression UI");
if (!html.includes('FIRST MIDTERM RAID') || !script.includes('const examSprintPlan=') || !script.includes("'2026-10-06'")) throw new Error("missing first midterm sprint plan");
if (!script.includes('const examSprintOrder=') || !script.includes('必讀保底') || !script.includes('熟練加分')) throw new Error("missing interleaved low-motivation pacing");
if (!script.includes('quest[0]=source[newIndex][0]')) throw new Error("interleaved quests must keep chronological slots");
if (!html.includes('id="coverageText"') || !html.includes('id="coverageFill"') || !script.includes('const examRequiredIndexes=') || !script.includes('必讀保底')) throw new Error("missing guaranteed scope coverage system");
if (!html.includes('id="examPlanTableBody"') || !html.includes('id="examPlanSummary"') || !script.includes('function renderExamPlanTable')) throw new Error("missing full exam review table");
if (!html.includes('id="weekPanel"') || !html.includes('id="weekCalendar"') || !script.includes('function renderWeek') || !script.includes('data-week-add')) throw new Error("missing weekly calendar task flow");
if (!html.includes('FOCUS FOREST') || !html.includes('id="forestPlants"') || !html.includes('data-forest-filter="week"') || !script.includes('function plantFocusTree') || !script.includes("db.from('focus_forest')")) throw new Error("missing focus forest flow");
if (!script.includes('function rawMissionsFor') || !script.includes("type:'昨日續關'") || !script.includes("q.quadrant==='urgent_important'")) throw new Error("missing urgent carryover flow");
if (script.includes("['2026-09-29','作文'") || script.includes("['2026-09-30','英文聽力'")) throw new Error("first midterm writing/listening review should be excluded");
for (const subject of ['物理','化學','生物','數學','國文','英文','公民','地理']) if (!script.includes(`'${subject}'`)) throw new Error(`missing subject plan: ${subject}`);
console.log(JSON.stringify({ htmlBytes: Buffer.byteLength(html), scriptBytes: Buffer.byteLength(script), scriptSyntax: "ok", coreUi: "ok", taskEditing: "ok", dragAndDrop: "ok", missionTimer: "ok", fullscreenFocus: "ok", dailyReflection: "ok", examBosses: "ok", scoreChart: "ok", firstMidtermSprint: "ok" }));
