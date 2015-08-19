React = require 'react'

div = React.createFactory 'div'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'image-loading'

  propTypes:
    uploading: T.bool
    onClick: T.func
    src: T.string.isRequired

  getInitialState: ->
    loading: true
    loaded: false

  componentDidMount: ->
    if not @props.uploading
      @load()

  componentWillReceiveProps: (props) ->
    @load(props.src)

  componentWillUnmount: ->
    @destroy()

  load: (src) ->
    @imgEl = document.createElement 'img'
    @imgEl.onload = @onLoad
    @imgEl.onerror = @onError
    @imgEl.src = src or @props.src

  destroy: ->
    if @imgEl
      delete @imgEl

  onLoad: ->
    @setState
      loading: false
      loaded: true
    @destroy()

  onError: ->
    @setState
      loading: false
      loaded: false
    @destroy()

  onClick: (event) ->
    @props.onClick?(event)

  onReloadImage: (event) ->
    @setState loading: true
    @load()

  renderImage: ->
    if @props.uploading or not @state.loaded
      div className: 'image-error'
    else
      img src: @props.src, onClick: @onClick

  renderButton: ->
    return if @state.loaded
    if not @state.loading
      div className: 'image-reload', onClick: @onReloadImage,
        span className: 'icon icon-refresh'

  renderLoading: ->
    return if @state.loaded
    if @state.loading
      div className: 'image-loader-box',
        div className: 'image-loader',
          span className: 'icon icon-refresh'

  render: ->
    div className: 'image-loading',
      @renderImage()
      @renderButton()
      @renderLoading()