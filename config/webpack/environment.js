const { environment } = require('@rails/webpacker')
var webpack = require('webpack');

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Rails: '@rails/ujs'
  })
)

module.exports = environment
