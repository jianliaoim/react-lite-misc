
React = require 'react'

div = React.createFactory 'div'

module.exports = React.createClass
  displayName: 'loading-indicator'

  render: ->
    div className: 'loading-indicator',
      div className: 'loader-dot'
      div className: 'loader-dot'
      div className: 'loader-dot'
