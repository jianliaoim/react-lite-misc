React = require 'react'

div    = React.createFactory 'div'
span   = React.createFactory 'span'
input  = React.createFactory 'input'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'search-box'

  propTypes:
    value:     T.string.isRequired
    onChange:  T.func.isRequired
    locale:    T.string.isRequired
    autoFocus: T.bool.isRequired
    onBlur:    T.func
    onConfirm: T.func

  onChange: (event) ->
    @props.onChange event.target.value

  onKeyDown: (event) ->
    if event.keyCode is 13
      @props.onConfirm? event.target.value

  onBlur: (event) ->
    @props.onBlur? event.target.value

  render: ->

    div className: 'search-box',
      span className: 'icon icon-search'
      input
        type: 'text', className: 'input', placeholder: @props.locale
        onChange: @onChange, value: @props.value
        onKeyDown: @onKeyDown, onBlur: @onBlur
        autoFocus: @props.autoFocus
