cx = require 'classnames'
React = require 'react'

div = React.createFactory 'div'
span = React.createFactory 'span'

T = React.PropTypes

module.exports = React.createClass
  displayName: 'switch-tabs'

  propTypes:
    data:       T.array.isRequired
    onTabClick: T.func.isRequired
    tab:        T.string.isRequired
    iconMap:    T.object
    getText:    T.func

  onTabClick: (tab) ->
    @props.onTabClick tab

  renderTab: (tab) ->
    className = cx
      entry: true
      'is-active': @props.tab is tab
    onClick = => @onTabClick tab
    if @props.iconMap?
      icon = @props.iconMap[tab]
    else
      icon = undefined
    text = if @props.getText? then @props.getText(tab) else tab
    div key: tab, className: className, onClick: onClick,
      if icon
        span className: "icon icon-#{icon}"
      span className: 'text', text

  render: ->
    classObject =
      'switch-tabs': true
      'is-decorated': @props.iconMap?
    classObject["col-#{@props.data.length}"] = true
    className = cx classObject

    div className: className,
      @props.data.map @renderTab
