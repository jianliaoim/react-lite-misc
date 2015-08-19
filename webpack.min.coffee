ExtractTextPlugin = require 'extract-text-webpack-plugin'
fs = require 'fs'
webpack = require 'webpack'

config = require './webpack.config'

module.exports =
  entry:
    vendor: []
    main: [ './example/main', './example/main.less' ]
  output:
    path: 'build/'
    filename: '[name].[chunkhash:8].js'
    publicPath: './build/'
  resolve: config.resolve
  module: config.module
  plugins: [
    new (webpack.optimize.UglifyJsPlugin)(sourceMap: false)
    ->
      @plugin 'done', (stats) ->
        content = JSON.stringify(stats.toJson().assetsByChunkName, null, 2)
        fs.writeFileSync 'build/assets.json', content
  ]
