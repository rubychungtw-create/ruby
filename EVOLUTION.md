# Study Quest 進化史

這份紀錄保留網站從「一張能打勾的粉色任務表」到「多人可用的專注學習系統」的完整過程。GitHub 的 commit 順序就是實際開發順序，可以逐版比較畫面與程式碼。

## 第一階段：任務表變成遊戲

### v1 — 粉色任務表誕生

Commit `ebc8ea1` — Build pink study quest

- 建立第一版粉色遊戲化讀書計畫
- 將週考日期、科目與複習任務整理成每日關卡
- 加入 XP、等級、連續通關、Boss 倒數與完成勾選

### v2 — 英雄標題

Commit `7f77105` — Update hero title

- 將主標題改為「With great power comes great responsibility」
- 確立英雄任務的世界觀

### v3 — 玩家自訂關卡

Commit `219dff9` — Add custom daily quests

- 每天可以自行新增任務
- 不再受限於系統排好的固定讀書計畫

## 第二階段：從個人工具變成多人網站

### v4 — Google 帳號與雲端存檔

Commit `f016a78` — Add Google accounts and cloud-synced quest matrix

- 加入 Google 登入與登出
- 每位玩家的任務、完成狀態、XP、標題與主題分開儲存
- 任務改為緊急／重要四象限

### v5 — 正式登入所需頁面

Commit `6892785` — Add OAuth privacy and terms pages

- 加入隱私權政策與服務條款
- 完成 Google OAuth 正式公開所需的網站頁面

## 第三階段：英雄外觀與任務操作

### v6 — 英雄主題加入

Commit `a4065f5` — Add Spider-Man and Iron Man themes

- 加入蜘蛛人紅黑藍主題
- 加入鋼鐵人紅金主題

### v7 — 主題可讀性強化

Commit `df2ea0f` — Improve hero theme contrast and colors

- 蜘蛛人改以紅藍為主、黑色點綴
- 鋼鐵人改以紅金為主
- 強化文字對比，讓任務內容更清楚

### v8 — 任務可以直接整理

Commit `24c1888` — Add draggable categories and task editing

- 任務可拖曳到其他象限，直接改變分類
- 任務可以編輯，不必刪除重建
- 保留一鍵刪除操作

## 第四階段：專注循環與學習回想

### v9 — 任務炸彈計時器

Commit `371b594` — Add persistent mission countdown timer

- 加入 45 分鐘倒數專注
- 自動接續 10 分鐘短休
- 每完成四輪，自動進入 30 分鐘長休
- 計時狀態可雲端保存

### v9.1 — 計時器權限修正

Commit `d2fc18c` — Grant authenticated timer access

- 補齊登入玩家使用計時器資料表的權限
- 修正跨裝置同步所需的資料庫設定

### v10 — 放大專注與今日回想

Commit `5ade7e5` — Add fullscreen focus and daily reflections

- 計時器與時鐘可放大，減少畫面干擾
- 每項任務可記錄學到的重點與心得
- 支援拍照或上傳筆記圖片

## 第五階段：一次只做一件事

### v11 — 唯一目標與分心停車場

Commit `1a4c437` — Add focus goal and distraction parking

- 每輪計時前必須選定「本輪唯一目標」
- 放大計時器時仍會顯示目前目標
- 想到其他事情時，可先放入分心停車場
- 目標與分心清單依玩家帳號同步
- 介面拆成專注、任務、回想、行程、戰績五個分頁

### v11.1 — 更乾淨的專注頁

Commit `7671cae` — Move player stats to record tab

- 將等級、XP、連續通關等卡片移到戰績分頁
- 手機開啟時能更快看到 Boss、唯一目標與計時器

## 現在的方向

Study Quest 的核心不只是「排更多任務」，而是讓玩家能：

1. 看懂現在最重要的事。
2. 一次只處理一個目標。
3. 把分心暫存，而不是跟它硬碰硬。
4. 完成後用回想確認自己真的學會。
5. 從累積 XP 與版本紀錄中看見自己的成長。

