ExtractTextPlugin = require 'extract-text-webpack-plugin'
webpack = require 'webpack'

fontName = 'fonts/[name].[ext]'
imageName = 'images/[name].[ext]'

module.exports =
  entry:
    vendor: [
      'webpack-dev-server/client?http://localhost:8080'
      'webpack/hot/dev-server'
    ]
    main: [
      './example/main'
    ]
  output:
    path: 'build/'
    filename: '[name].js'
    publicPath: 'http://localhost:8080/build/'
  resolve:
    extensions: ['.coffee', '.js', '.jsx', '']
  module:
    loaders: [
      {test: /\.coffee$/, loader: 'coffee'}
      {test: /\.css$/, loader: 'style!css!autoprefixer'}
      {test: /\.js$/, exclude: /node_modules/, loader: 'babel'}
      {test: /\.jsx$/, exclude: /node_modules/, loader: 'babel'}
      {test: /\.less$/, loader: 'style!css!less!autoprefixer'}
      {test: /\.(png|jpg)$/, loader: 'url', query: {limit: 2048, name: imageName}}
      {test: /\.woff((\?|\#)[\?\#\w\d_-]+)?$/, loader: 'url', query: {limit: 100, minetype: 'application/font-woff', name: fontName}}
      {test: /\.woff2((\?|\#)[\?\#\w\d_-]+)?$/, loader: 'url', query: {limit: 100, minetype: 'application/font-woff2', name: fontName}}
      {test: /\.ttf((\?|\#)[\?\#\w\d_-]+)?$/, loader: 'url', query: {limit: 100, minetype: 'application/octet-stream', name: fontName}}
      {test: /\.eot((\?|\#)[\?\#\w\d_-]+)?$/, loader: 'url', query: {limit: 100, name: fontName}}
      {test: /\.svg((\?|\#)[\?\#\w\d_-]+)?$/, loader: 'url', query: {limit: 10000, minetype: 'image/svg+xml', name: fontName}}
    ]
  plugins: [
    new webpack.optimize.CommonsChunkPlugin 'vendor', 'vendor.js'
  ]