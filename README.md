# Study Quest｜粉紅學習英雄

把高中讀書計畫做成闖關遊戲的個人化學習網站。從一張粉色週考任務表開始，逐步進化成支援多人帳號、雲端同步、任務分類、專注計時與學習回想的完整工具。

🌐 線上版本：[pink-study-quest-115.sysjusts-2164.chatgpt.site](https://pink-study-quest-115.sysjusts-2164.chatgpt.site/)

## 現在可以做什麼

- 使用 Google 帳號登入，每位玩家保有自己的任務與設定
- 新增、編輯、刪除任務，並拖曳到四象限分類
- 切換粉色、天空藍、紫色、黃橘、蜘蛛人、鋼鐵人主題
- 使用 45 分鐘專注／10 分鐘短休／每四輪 30 分鐘長休的任務計時器
- 放大計時器進入專注模式
- 每輪鎖定一個「本輪唯一目標」
- 把突然想到的事情暫存在「分心停車場」
- 寫下今日重點、心得，並上傳筆記照片
- 用「專注、任務、回想、行程、戰績」五個分頁保持畫面清楚

## 專案結構

```text
dist/                    可直接發布的靜態網站
  index.html             頁面結構與主要介面
  app.js                 任務、登入、同步與計時邏輯
  cloud.css              雲端版樣式與主題
  privacy.html           隱私權政策
  terms.html             服務條款
supabase-schema-v2.sql   任務編輯資料庫升級
supabase-schema-v3.sql   專注計時器資料庫升級
supabase-schema-v4.sql   回想與筆記照片資料庫升級
supabase-schema-v5.sql   唯一目標與分心停車場資料庫升級
validate.mjs             發布前基本驗證
EVOLUTION.md             完整版本進化史
```

## 本機檢查

這是零建置步驟的靜態網站；可直接以瀏覽器或本機 HTTP server 開啟 `dist/`。

```bash
node --check dist/app.js
node validate.mjs
```

雲端功能使用 Supabase。資料表與 RLS 權限依序套用各版 `supabase-schema-v*.sql`；Google OAuth 需在自己的 Supabase 與 Google Cloud 專案設定允許的重新導向網址。

## 安全提醒

前端的 Supabase anon key 是設計給瀏覽器使用的公開金鑰，真正的資料隔離由 Row Level Security 保護。請勿把 Supabase `service_role`、GitHub token 或任何私人密碼提交到儲存庫。

## 版本故事

本專案保留從第一版到目前版本的真實 Git commit，而不是把完成品一次上傳。請見 [EVOLUTION.md](EVOLUTION.md) 查看每次進化的原因與成果。

