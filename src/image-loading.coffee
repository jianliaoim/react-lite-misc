React = require 'react'

LoadingIndicator = React.createFactory require './loading-indicator'

img = React.createFactory 'img'

T = React.PropTypes


module.exports = React.createClass
  displayName: 'image-loading'

  propTypes:
    src: T.string.isRequired
    onClick: T.func.isRequired

  getInitialState: ->
    isLoading: false
    error: null

  componentDidMount: ->
    @setState isLoading: true

    @imgEl = document.createElement 'img'
    @imgEl.src = @props.src
    @imgEl.onload = @onload
    @imgEl.onerror = @onerror

  componentWillUnmount: ->
    @imgEl.onload = null
    @imgEl.onerror = null

  onload: ->
    @setState isLoading: false

  onerror: ->
    @setState isLoading: false, error: "Failed to load image"

  onClick: (event) ->
    @props.onClick(event)

  render: ->
    if @state.isLoading
      LoadingIndicator()
    else if @state.error?
      @state.error
    else
      img src: @props.src, onClick: @onClick
