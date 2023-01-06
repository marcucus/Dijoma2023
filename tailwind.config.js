/** @type {import('tailwindcss').Config} */
const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
  ],
  theme: {
    extend: {
      colors: {
        sky: colors.sky,
        teal: colors.teal,
        rose: colors.rose,
        'apple':'#000000cc',
        'appleground':'#fff',
      },
    },
  },
  plugins: [require('@tailwindcss/aspect-ratio'),],
}