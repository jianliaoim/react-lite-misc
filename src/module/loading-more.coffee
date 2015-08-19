cx = require 'classnames'
React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'loading-more'

  propTypes:
    show:       T.bool.isRequired
    end:        T.bool.isRequired
    endLocale:  T.string # since no case to show

  render: ->
    className = cx 'loading-more', 'loading-indicator',
      muted: @props.end


    if @props.show
      if @props.end
        div className: className,
          @props.endLocale
      else
        div className: className,
          div className: 'loader-dot'
          div className: 'loader-dot'
          div className: 'loader-dot'
    else
      div className: className
