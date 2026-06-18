FROM node:22-alpine

WORKDIR /app

# 1. Copy only dependency manifests first
COPY package*.json ./

# 2. Install dependencies (this layer stays cached unless packages change)
RUN npm install

# 3. Copy the rest of your application source code
COPY . .

# 4. Expose the port your Express app listens on (good practice for documentation)
EXPOSE 3000

CMD ["node", "server.js"]
