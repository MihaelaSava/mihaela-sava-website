/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./app/views/**/*.{html.erb,erb}",
    "./app/helpers/**/*.rb",
    "./app/components/**/*.{html.erb,erb,rb}",
    "./app/javascript/**/*.{js,ts}",
    "./app/assets/tailwind/**/*.css",
    "./app/assets/stylesheets/**/*.{css,scss,sass}"
  ],

  safelist: [
    "min-h-screen",
    "h-screen",
    "bg-cover",
    "bg-center",
    "text-white",
    "pt-16",
    "backdrop-blur-sm"
  ],

  theme: {
    extend: {}
  },

  plugins: []
};
