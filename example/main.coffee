React = require 'react'

data = require './data'

LiteCopyarea = React.createFactory require('../src/index').Copyarea
LiteSwitcher = React.createFactory require('../src/index').Switcher
LiteWheeling = React.createFactory require('../src/index').Wheeling
LiteSearchBox = React.createFactory require('../src/index').SearchBox
LiteSwitchTabs = React.createFactory require('../src/index').SwitchTabs
LiteLoadingMore = React.createFactory require('../src/index').LoadingMore
LiteColorChooser = React.createFactory require('../src/index').ColorChooser
LiteImageLoading = React.createFactory require('../src/index').ImageLoading
LiteLoadingCircle = React.createFactory require('../src/index').LoadingCircle
LiteLoadingIndicator = React.createFactory require('../src/index').LoadingIndicator

div = React.createFactory 'div'
span = React.createFactory 'span'
button = React.createFactory 'button'

T = React.PropTypes

App = React.createFactory React.createClass
  displayName: 'app'

  renderLoadingCircle: ->
    arr = ['#5c6bc0', '#883297', '#424242', '#009688', '#1976d2', '#399963']
    div className: 'section',
      div className: 'title', 'Loading Circle'
      div className: 'column',
        for color in arr
          LiteLoadingCircle size: 50, stroke: color, strokeWidth: 3

  render: ->
    div className: 'app',
      @renderLoadingCircle()

React.render App(), document.querySelector '.example'
