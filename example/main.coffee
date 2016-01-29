require './main.less'

React = require 'react'
ReactDOM = require 'react-dom'

ImageLoading = React.createFactory require('../src/index').ImageLoading
LoadingCircle = React.createFactory require('../src/index').LoadingCircle
Wheeling = React.createFactory require('../src/index').Wheeling

button = React.createFactory 'button'
div = React.createFactory 'div'
span = React.createFactory 'span'

T = React.PropTypes

onlineImage = 'http://api.adorable.io/avatars/285/abott@adorable.io.png'
localImage = 'data:image/gif;base64,R0lGODlhEAAQAMQAAORHHOVSKudfOulrSOp3WOyDZu6QdvCchPGolfO0o/XBs/fNwfjZ0frl3/zy7////wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH5BAkAABAALAAAAAAQABAAAAVVICSOZGlCQAosJ6mu7fiyZeKqNKToQGDsM8hBADgUXoGAiqhSvp5QAnQKGIgUhwFUYLCVDFCrKUE1lBavAViFIDlTImbKC5Gm2hB0SlBCBMQiB0UjIQA7'
failedImage = 'asdf'

App = React.createFactory React.createClass
  displayName: 'app'

  getInitialState: ->
    showLocalImage: false

  renderImageLoading: ->
    div className: 'section',
      div className: 'title', 'Image Downloading'
      ImageLoading
        src: onlineImage

  renderImageLocal: ->
    div className: 'section',
      div className: 'title', 'Local Image'
      button onClick: @toggleLocal, 'Render Local Image'
      if @state.showLocalImage
        ImageLoading
          src: localImage
      ImageLoading
        src: localImage

  renderImageFailed: ->
    div className: 'section',
      div className: 'title', 'Image Failed'
      ImageLoading
        src: failedImage

  renderLoadingCircle: ->
    div className: 'section',
      LoadingCircle()

  toggleLocal: ->
    @setState showLocalImage: not @state.showLocalImage

  renderWheeling: ->
    onScroll = (data) ->
      console.log(data)
    div className: 'section', style: {height: '300px'},
      Wheeling className: 'wheeling-inner-section', onScroll: onScroll,
        div style: {height: '1000px'}

  render: ->
    div className: 'app',
      @renderImageLoading()
      @renderImageLocal()
      @renderImageFailed()
      @renderLoadingCircle()
      @renderWheeling()

mount = document.getElementById 'example'

ReactDOM.render App(), mount
