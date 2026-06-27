# 使用輕量級的 Node.js 18 官方 Alpine 鏡像
FROM node:18-alpine

# 設定工作目錄
WORKDIR /app

# 複製 package.json 和 package-lock.json（若有）
COPY package*.json ./

# 雖然專案本身為零依賴，但執行此步驟可確保未來若新增依賴時能正常安裝
RUN npm install --production

# 複製專案的所有原始碼
COPY . .

# 暴露服務運行的連接埠（預設為 8787）
EXPOSE 8787

# 啟動命令
CMD ["node", "src/server.mjs"]
