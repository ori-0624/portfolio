const { environment } = require('@rails/webpacker');
const typescript =  require('./loaders/typescript')

// Add jQuery and Bootstrap
// pluginsが読めずエラーになるのでいったんコメントアウト
// superでエラーになるので恐らくwebpack自体がだめ
const webpack = require('webpack');
environment.plugins.prepend(
  'provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  }));

environment.loaders.prepend('typescript', typescript)
module.exports = environment;