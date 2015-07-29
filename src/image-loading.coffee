React = require 'react'

LoadingIndicator = React.createFactory require './loading-indicator'

img = React.createFactory 'img'
div = React.createFactory 'div'

T = React.PropTypes


module.exports = React.createClass
  displayName: 'image-loading'

  propTypes:
    src: T.string.isRequired
    onClick: T.func.isRequired

  getInitialState: ->
    loadingState: 0

  componentDidMount: ->
    #@setState loadingState: 0
    ###
      -1: error
      0 : loading
      1 : complete
    ###
    @imgEl = document.createElement 'img'
    @imgEl.onload = @onload
    @imgEl.onerror = @onerror
    @imgEl.src = @props.src


  componentWillUnmount: ->
    @destroy()

  onload: ->
    @setState loadingState: 1
    @destroy()

  onerror: ->
    @setState loadingState: -1
    @destroy()

  onClick: (event) ->
    @props.onClick(event)

  onReload: ->
    @setState loadingState: 0
    @componentDidMount()


  destroy: ->
    if @imgEl
      @imgEl.onload = null
      @imgEl.onerror = null
      @imgEl = null

  render: ->
    switch @state.loadingState
      when -1
        div className: 'image-loading is-error',
          div className: 'reload', onClick: @onReload, '失败-重新加载'
      when 0
        LoadingIndicator()
      when 1
        img src: @props.src, onClick: @onClick
