
React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes
cx = require 'classnames'

module.exports = React.createClass
  displayName: 'switch-button'

  propTypes:
    checked: T.bool.isRequired
    onClick: T.func.isRequired

  onClick: ->
    @props.onClick (not @props.checked)

  render: ->

    div
      className: cx
        'switch-button': true
        'is-checked': @props.checked
      onClick: @onClick
      div className: 'button', @props.checked
