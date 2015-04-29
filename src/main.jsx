
import {default as React} from 'react'

import {ColorChooser} from './index'
import './color-chooser.css';

import {Copyarea} from './index'
import './copyarea.css'

// not ready
// import {ImageLoading} from './index'
import './image-loading.css'

import {LoadingIndicator} from './index'
import './loading-indicator.css'

import {Switcher} from './index'
import './switcher.css'

import {SwitchTabs} from './index'
import './switch-tabs.css'

import {Wheeling} from './index'
import './wheeling.css'

import './demo.css'

var tabs = ['one', 'two', 'three']

var App = React.createClass({

  getInitialState: function() {
    return {
      color: 'blue',
      isSwicherOn: false,
      tab: tabs[0],
      info: ''
    }
  },

  onColorClick: function(color) {
    this.setState({color: color})
  },

  onSwitcherClick: function() {
    this.setState({isSwicherOn: !this.state.isSwicherOn})
  },

  onTabClick: function(tab) {
    this.setState({tab: tab})
  },

  onScroll: function(info) {
    this.setState({info: info})
  },

  // renderers

  renderColorChooser: function() {
    return <ColorChooser
      onColorClick={this.onColorClick}
      chosen={this.state.color}
      data={{
        red: '#f00',
        green: '#0f0',
        blue: '#00f'
      }}
    ></ColorChooser>
  },

  renderCopyarea: function() {
    return <Copyarea text="hover and copy"/>
  },

  renderLoadingIndicator: function() {
    return <LoadingIndicator/>
  },

  renderSwitcher: function() {
    return <Switcher
      checked={this.state.isSwicherOn}
      onClick={this.onSwitcherClick} />
  },

  renderSwitchTabs: function() {
    return <div className="tabs-wrapper">
      <SwitchTabs data={tabs} onTabClick={this.onTabClick} tab={this.state.tab} />
      <div className="content">
        {(this.state.tab == 'one') ? <div>{'content of tab one'}</div> : undefined}
        {(this.state.tab == 'two') ? <div>{'content of tab two'}</div> : undefined}
        {(this.state.tab == 'three') ? <div>{'content of tab three'}</div> : undefined}
      </div>
    </div>
  },

  renderWheeling: function() {
    return <div>
      <pre>
        <code>
          {JSON.stringify(this.state.info, null, 2)}
        </code>
      </pre>
      <Wheeling onScroll={this.onScroll}>
        <div className="content">
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
          <br/><br/>
          {'something inside scroll:'}
        </div>
      </Wheeling>
    </div>
  },

  render: function() {
    return <div className="app">
      <div className="about">{'Color Chooser'}</div>
      {this.renderColorChooser()}
      <div className="about">{'try copy'}</div>
      {this.renderCopyarea()}
      <div className="about">{'loading'}</div>
      {this.renderLoadingIndicator()}
      <div className="about">{'switcher'}</div>
      {this.renderSwitcher()}
      <div className="about">{'tabs'}</div>
      {this.renderSwitchTabs()}
      <div className="about">{'scroller'}</div>
      {this.renderWheeling()}
    </div>
  }
})

React.render(<App/>, document.querySelector('.demo'))
