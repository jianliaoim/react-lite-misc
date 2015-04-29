
React = require 'react'
debounce = require './debounce'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'wheeling'

  propTypes:
    onScroll: T.func.isRequired

  componentDidMount: ->
    @_rootEl = @getDOMNode()
    @debounceDetect = debounce @detect, 400

  onWheel: (evet) ->
    @debounceDetect(event)

  detect: (event) ->
    info =
      atTop: @_rootEl.scrollTop is 0
      atBottom: (@_rootEl.scrollTop + @_rootEl.clientHeight) is @_rootEl.scrollHeight
      goingUp: event.deltaY < 0
      goingDown: event.deltaY > 0
    @props.onScroll info

  render: ->
    div className: 'wheeling', onWheel: @onWheel,
      @props.children
