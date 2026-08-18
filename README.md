# Frontend DevTools

A small collection of front-end developer utilities built with [Svelte](https://svelte.dev/) and [Vite](https://vitejs.dev/), styled with [Tailwind CSS](https://tailwindcss.com/).

Currently available tools:

- **Size & Spacing** – quick reference/generator for width, height, min/max width & height, margin and padding utility values.
- **SVG** – convert SVG markup to a base64 data URI or to a Blade component snippet.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)

All Node/npm commands run inside Docker so dependency and tooling versions stay locked to what's defined in the `Dockerfile` — you don't need Node or npm installed locally.

## Getting started

The `Dockerfile` has three targets: `dev`, `build` and `runtime` (the default).

### Development server (with hot module reloading)

Build the `dev` image:

```sh
docker build --target dev -t frontend-devtools:dev .
```

Run it, mounting the source so edits on the host are picked up, while keeping the container's own `node_modules` (with the locked dependency versions):

```sh
docker run --rm -p 5173:5173 -v "$PWD":/app -v /app/node_modules frontend-devtools:dev
```

The app will be available at http://localhost:5173.

### Production build & preview

Build the production image (builds the static bundle and serves it with nginx):

```sh
docker build -t frontend-devtools .
```

Run it:

```sh
docker run --rm -p 8080:80 frontend-devtools
```

The app will be available at http://localhost:8080.

## Deployment

Pushes/merges to the `main` branch automatically trigger a [GitHub Actions workflow](.github/workflows/deploy.yml) that builds the project and deploys it to [GitHub Pages](https://pages.github.com/).

## Project structure

```
src/
├── App.svelte          # App root
├── main.js             # Entry point
└── lib/
    ├── SizeAndSpacing/  # Size & spacing utilities
    └── Svg/             # SVG conversion utilities
```

## Tech stack

- [Svelte](https://svelte.dev/) 5
- [Vite](https://vitejs.dev/) 7
- [Tailwind CSS](https://tailwindcss.com/) 3
