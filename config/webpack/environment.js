const { environment } = require('@rails/webpacker');

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

module.exports = environment;