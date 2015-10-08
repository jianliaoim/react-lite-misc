cx = require 'classnames'
React = require 'react'

div = React.createFactory 'div'
svg = React.createFactory 'svg'
span = React.createFactory 'span'
circle = React.createFactory 'circle'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'loading-circle'

  propTypes:
    size: T.number
    onClick: T.func
    # stroke property
    stroke: T.string
    strokeWidth: T.number
    strokeLinecap: T.string

  getDefaultProps: ->
    size: 50
    stroke: '#888'
    strokeWidth: 2
    strokeLinecap: 'round'

  render: ->
    style =
      width: @props.size
      height: @props.size
      cursor: if @props.onClick? then 'pointer' else undefined
    div className: 'lite-loading-circle', style: style, onClick: @props.onClick,
      svg
        width: @props.size
        height: @props.size
        viewPort: "0 0 #{ @props.size } #{ @props.size }"
        className: 'inner',
          circle
            r: (@props.size / 2.5)
            cx: (@props.size / 2)
            cy: (@props.size / 2)
            fill: 'transparent'
            className: 'inner-circle'
            stroke: @props.stroke
            strokeWidth: @props.strokeWidth
            strokeLinecap: @props.strokeLinecap
            strokeDasharray: '251.2%'
