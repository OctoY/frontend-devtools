export default {
  content: ['./index.html', './src/**/*.{svelte,js,ts}'],
  theme: {
    extend: {
      fontFamily: {
        sans: 'Noto Sans, sans-serif',
      },
      colors: {
        white: '#ffffffe6',
        secondary: '#ffffffaa',
        black: '#17191c',
        gray: '#22252a',
        rebeccapurple: 'rebeccapurple',
        coffee: '#c0ffee',
        readonly: '#4e5155',
      },
    },
  },
  plugins: [],
};
