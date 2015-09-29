React = require 'react'

debounce = require 'debounce'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'wheeling'

  propTypes:
    delay:    T.number
    onScroll: T.func.isRequired

  getDefaultProps: ->
    delay: 400

  componentDidMount: ->
    @_rootEl = @getDOMNode()
    @debounceDetect = debounce @detect, @props.delay

  onWheel: (event) ->
    @debounceDetect event.nativeEvent

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
