React = require 'react'

img = React.createFactory 'img'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'image-local'

  propTypes:
    onClick: T.func
    onLoaded: T.func
    src: T.string

  getInitialState: ->
    src: @props.src

  componentWillReceiveProps: (next) ->
    if next.src? and next.src.startsWith('data:')
      @setState src: next.src

  onClick: ->
    @props.onClick?()

  onLoaded: ->
    @props.onLoaded?()

  render: ->
    img
      src: @state.src
      onClick: @onClick
      onLoaded: @onLoaded