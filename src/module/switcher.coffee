cx = require 'classnames'
React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

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
      div className: 'inner-button', @props.checked
