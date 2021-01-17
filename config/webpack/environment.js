const { environment } = require('@rails/webpacker')

// Add jQuery and Bootstrap
const webpack = require('webpack')
environment.plugins.prepend(
  'provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  }))
  
module.exports = environment
