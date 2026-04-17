FROM node:20.20.2

WORKDIR /app

COPY package*.json ./
COPY .nvmrc ./
COPY scripts/ ./scripts/

RUN npm ci
RUN npm run prepublish
RUN npm run build

EXPOSE 8601

CMD ["npm", "start"]
