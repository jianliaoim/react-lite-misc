React = require 'react'

input = React.createFactory 'input'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'copyarea'

  propTypes:
    text: T.string.isRequired

  componentDidMount: ->
    @getDOMNode().select()

  onEnter: (event) ->
    event.target.select()

  render: ->
    input
      className: 'copyarea form-control', readOnly: true
      onMouseEnter: @onEnter, value: @props.text
