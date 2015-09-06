React = require 'react'

div = React.createFactory 'div'
i = React.createFactory 'i'
img = React.createFactory 'img'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'image-loading'

  propTypes:
    onClick: T.func
    onLoaded: T.func
    src: T.string.isRequired

  getInitialState: ->
    loading: null
    loaded: null

  componentDidMount: ->
    @load()

  componentWillReceiveProps: (props) ->
    if @props.src isnt props.src
      @load()

  componentWillUnmount: ->
    @destroy()

  load:  ->
    @imgEl = document.createElement 'img'
    @imgEl.onload = @onLoad
    @imgEl.onerror = @onError
    @imgEl.src = @props.src
    # set state depending on the status of the local image
    @setState
      loaded: @imgEl.complete
      loading: not @imgEl.complete

  destroy: ->
    if @imgEl
      @imgEl.onload = null
      @imgEl.onerror = null
      @imgEl = null

  onLoad: ->
    @setState
      loading: false
      loaded: true
    @onLoaded()

  onError: ->
    @setState
      loading: false
      loaded: false

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  onReloadImage: (event) ->
    @setState loading: true
    @load()

  renderImage: ->
    if @state.loaded
      img src: @props.src, onClick: @onClick
    else
      div className: 'image-error'

  renderButton: ->
    if not @state.loaded and not @state.loading
      div className: 'image-reload', onClick: @onReloadImage,
        i className: 'icon icon-refresh'

  renderLoading: ->
    if not @state.loaded and @state.loading
      div className: 'image-loader-box',
        div className: 'image-loader',
          i className: 'icon icon-refresh'

  render: ->
    # do not render anything until we determine the states of the image
    # it's either:
    # - a local image, which means we can render it immediately
    # - a online image, we need to show the loading image first
    return null if not @state.loaded?

    div className: 'image-loading',
      @renderImage()
      @renderButton()
      @renderLoading()
