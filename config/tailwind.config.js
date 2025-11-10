module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/components/**/*.{rb,erb}',
    './app/assets/stylesheets/**/*.css',
    './app/assets/tailwind/**/*.css'
  ],

  safelist: [
    'min-h-screen',
    'h-screen',
    'bg-cover',
    'bg-center',
    'text-white',
    'pt-16',
    'backdrop-blur-sm'
  ],

  theme: {
    extend: {},
  },

  plugins: [],
}
