# claude-progress 📄

讓 [Claude Code](https://claude.com/claude-code) 多兩個超實用的自訂指令，幫你在**任何專案**之間「凍結進度、無痛接手」——不管是明天的自己、還是換一台電腦。

- **`/上次的進度`** — 完整印出某個專案上次做到哪、下一步是什麼。
- **`/存進度`** — 把目前專案這次的進度寫進它的交接檔。

> 原本是為了「換電腦也能接續工作」做的，後來發現每天開工前打一下 `/上次的進度` 超省事，就整理成這個 repo。

---

## 它怎麼運作（一個簡單慣例）

> **一個專案 = 一個資料夾 + 裡面一個 `RESUME.md`（交接檔）**

- `/存進度` 會把進度寫進「目前專案資料夾」的 `RESUME.md`。
- `/上次的進度` 會掃描你的專案資料夾、找到對應的 `RESUME.md`，**一字不漏完整印出來**。

不綁定任何特定專案，加新專案不用改設定。

---

## 安裝

```bash
git clone https://github.com/<你的帳號>/claude-progress.git
cd claude-progress
bash install.sh
```

安裝會把兩個指令複製到 `~/.claude/commands/`。**重開 Claude Code** 後即可使用。

> 預設假設專案放在 `~/Desktop/claude/<專案名>/`。若你的專案在別的位置，第一次用時跟 Claude 講一下路徑即可，或自行修改 `~/.claude/commands/上次的進度.md` 裡的掃描路徑。

---

## 使用

| 指令 | 作用 |
|---|---|
| `/上次的進度` | 列出所有專案進度檔，自動印出**最近動過**的那個 |
| `/上次的進度 IG` | 印出名稱含「IG」的專案進度 |
| `/存進度 今天接好了金流，待辦剩 webhook` | 把目前專案這次進度寫進它的 `RESUME.md` |

### 典型一天
```
早上：開 Claude Code → /上次的進度        # 秒接回昨天
收工：/存進度 今天做了X，下一步是Y         # 留言給明天的自己
換電腦：clone+install → /上次的進度        # 另一台無痛接手
```

---

## 安全

`/存進度` 有鐵則：**永遠不會把 API 金鑰、密碼、token 的「內容」寫進 `RESUME.md`，只記它放在哪個檔**。把你的 `.env` 加進 `.gitignore` 即可安心。

---

## 結構

```
claude-progress/
├── commands/
│   ├── 上次的進度.md     # /上次的進度 指令
│   └── 存進度.md         # /存進度 指令
├── templates/
│   └── RESUME.template.md # 新專案交接檔範本
├── install.sh
└── README.md
```

## 授權

MIT
