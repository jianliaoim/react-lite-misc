React = require 'react'

debounce = require '../util/debounce'

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
    @_rootEl = @refs.root
    @_wasGoingUp = false
    @_wasGoingDown = false
    @debounceDetect = debounce @detect, @props.delay

  onWheel: (event) ->
    if event.deltaY > 0
      @_wasGoingUp = false
      @_wasGoingDown = true
    else if event.deltaY < 0
      @_wasGoingUp = true
      @_wasGoingDown = false
    # we cannot directly pass event.deltaY to this debounced function
    # because event.deltaY would end up with either 0 or -0
    # resulting goingUp and goingDown with false no matter what
    @debounceDetect()

  detect: ->
    info =
      atTop: @_rootEl.scrollTop is 0
      atBottom: (@_rootEl.scrollTop + @_rootEl.clientHeight) is @_rootEl.scrollHeight
      goingUp: @_wasGoingUp
      goingDown: @_wasGoingDown
    @props.onScroll info

  render: ->
    div ref: 'root', className: 'wheeling', onWheel: @onWheel,
      @props.children
