# --- Base: install locked dependencies ---
# Pinned to satisfy Vite's minimum required Node version (^20.19.0 || >=22.12.0).
FROM node:20.19-alpine AS base
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

# --- Dev: run the Vite dev server with HMR ---
# docker build --target dev -t frontend-devtools:dev .
# docker run --rm -p 5173:5173 -v "$PWD":/app -v /app/node_modules frontend-devtools:dev
FROM base AS dev
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

# --- Build: produce the static production bundle ---
FROM base AS build
COPY . .
# Serve from the root when running via Docker (no GitHub Pages sub-path).
ENV BASE_PATH=/
RUN npm run build

# --- Runtime: serve the production bundle with nginx (default target) ---
FROM nginx:alpine AS runtime
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
