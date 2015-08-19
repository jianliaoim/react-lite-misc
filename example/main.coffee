require './main.less'

React = require 'react'

ImageLoading = React.createFactory require('../src/index').ImageLoading

button = React.createFactory 'button'
div = React.createFactory 'div'
span = React.createFactory 'span'

T = React.PropTypes

App = React.createFactory React.createClass
  displayName: 'app'

  getInitialState: ->
    imageLoading:
      status: 'Uploading'

  onChangeImageLoading: (event) ->
    @setState
      imageLoading:
        status: 'Done'

  renderImageLoading: ->
    div className: 'section',
      div className: 'title', 'Image Loading'
        div className: 'action',
          if @state.imageLoading.uploading
            button className: 'button', onClick: @onChangeImageLoading, 'Change Status'
          span className: 'status', @state.imageLoading.status
      ImageLoading
        src: 'https://api.adorable.io/avatars/250/image-loading'

  render: ->
    div className: 'app',
      @renderImageLoading()

mount = document.getElementById 'example'

React.render App(), mount
