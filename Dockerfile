FROM node:20.20.2

WORKDIR /app

COPY package*.json ./
COPY .nvmrc ./
COPY scripts/ ./scripts/
COPY src/ ./src/
COPY webpack.config.js ./
COPY static/ ./static/

RUN npm ci
RUN npm run prepublish
RUN npm run build

EXPOSE 8601

CMD ["npm", "start"]
