# Frontend DevTools

A small collection of front-end developer utilities built with [Svelte](https://svelte.dev/) and [Vite](https://vitejs.dev/), styled with [Tailwind CSS](https://tailwindcss.com/).

Currently available tools:

- **Size & Spacing** – quick reference/generator for width, height, min/max width & height, margin and padding utility values.
- **SVG** – convert SVG markup to a base64 data URI or to a Blade component snippet.

## Prerequisites

- [Node.js](https://nodejs.org/) 20+
- npm 10+

## Getting started

Install dependencies:

```sh
npm install
```

Run the app in development mode with hot module reloading:

```sh
npm run dev
```

Build the production bundle (output goes to `dist/`):

```sh
npm run build
```

Preview the production build locally:

```sh
npm run preview
```

## Running with Docker

A minimal multi-stage `Dockerfile` is included: it builds the app with Node and serves the static output with nginx.

Build the image:

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

- [Svelte](https://svelte.dev/) 4
- [Vite](https://vitejs.dev/) 4
- [Tailwind CSS](https://tailwindcss.com/) 3
