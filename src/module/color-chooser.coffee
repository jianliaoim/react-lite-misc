cx = require 'classnames'
React = require 'react'

div  = React.createFactory 'div'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'color-chooser'

  propTypes:
    data:         T.object.isRequired
    onColorClick: T.func.isRequired
    chosen:       T.string.isRequired

  onColorClick: (color) ->
    @props.onColorClick color

  renderIcons: (color, name) ->
    names = Object.keys(@props.data)
    names.map (name) =>
      color = @props.data[name]
      className = cx 'color-icon', 'ti',
        'ti-tick': @props.chosen is name
        'is-chosen': @props.chosen is name
      style =
        backgroundColor: color or '#ff9800'
      onClick = => @onColorClick name

      span key: name, className: className, style: style, onClick: onClick

  render: ->
    div className: 'color-chooser',
      @renderIcons()
