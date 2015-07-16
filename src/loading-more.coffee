React = require 'react'

div = React.createFactory 'div'

T = React.PropTypes
cx = require 'classnames'

module.exports = React.createClass
  displayName: 'loading-more'

  propTypes:
    show:       T.bool.isRequired
    end:        T.bool.isRequired
    endLocale:  T.string # since no case to show

  render: ->
    className = cx 'loading-more', 'loading-indicator',
      'is-hidden': (not @props.show) and (not @props.end)
      muted: @props.end

    div className: className,
      if @props.end
        @props.endLocale
      else [
        div key: 'a', className: 'loader-dot'
        div key: 'b', className: 'loader-dot'
        div key: 'c', className: 'loader-dot'
      ]