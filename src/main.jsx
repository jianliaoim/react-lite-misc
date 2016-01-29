import React from 'react'
import ReactDOM from 'react-dom'

import {ColorChooser} from './index'
import './color-chooser.css'

import {Copyarea} from './index'
import './copyarea.css'

import {LoadingIndicator} from './index'
import './loading-indicator.css'

import {Switcher} from './index'
import './switcher.css'

import {SwitchTabs} from './index'
import './switch-tabs.css'

import {Wheeling} from './index'
import './wheeling.css'

import {SearchBox} from './index'
require('teambition-icon-fonts/css/teambition-ui-icons.css')
import './search-box.css'

import {LoadingMore} from './index'
import './loading-more.css'

import {ImageLoading} from './index'
import './image-loading.css'

import './demo.css'

var tabs = ['one', 'two', 'three']

var App = React.createClass({

  getInitialState() {
    return {
      color: 'blue',
      isSwicherOn: false,
      tab: tabs[0],
      info: '',
      searchBoxValue: 'teambition',
      showImageLoading: false,
      showLoadingMore: true,
      endLoadingMore: false
    };
  },

  onSearchChange(value){
    this.setState({searchBoxValue: value})
  },


  onColorClick(color) {
    this.setState({color: color})
  },

  onSwitcherClick() {
    this.setState({isSwicherOn: !this.state.isSwicherOn})
  },

  onTabClick(tab) {
    this.setState({tab: tab})
  },

  onScroll(info) {
    this.setState({info: info})
  },

  // renderers

  renderColorChooser() {
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

  renderCopyarea() {
    return <Copyarea text="Hover and use Command C"/>
  },

  renderLoadingIndicator() {
    return <LoadingIndicator/>
  },

  renderSwitcher() {
    return <Switcher
      checked={this.state.isSwicherOn}
      onClick={this.onSwitcherClick} />
  },

  renderSwitchTabs() {
    return <div className="tabs-wrapper">
      <SwitchTabs data={tabs} onTabClick={this.onTabClick} tab={this.state.tab} />
      <div className="content">
        {(this.state.tab == 'one') ? <div>{'content of tab one'}</div> : undefined}
        {(this.state.tab == 'two') ? <div>{'content of tab two'}</div> : undefined}
        {(this.state.tab == 'three') ? <div>{'content of tab three'}</div> : undefined}
      </div>
    </div>
  },

  renderWheeling() {
    return <div>
      <pre>
        <code>
          {JSON.stringify(this.state.info, null, 2)}
        </code>
      </pre>
      <Wheeling onScroll={this.onScroll}>
        <div className="content">
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
          <br/><br/>
          {'Scroll and stop to see result'}
        </div>
      </Wheeling>
    </div>;
  },
  renderSearchBox() {
    return <SearchBox value={this.state.searchBoxValue} autoFocus={false} onChange={this.onSearchChange} onBlur={()=>{alert('Blurred')}} onConfirm={()=>{alert('Confirmed')}}
      locale="zh-cn"/>
  },
  renderLoadingMore(){
    return (
      <div className="loading-more-demo">
        <div className="switch">
          Show:
          <Switcher
              checked={this.state.showLoadingMore}
              onClick={()=>{
                this.setState({showLoadingMore:!this.state.showLoadingMore})
              }}/>
        </div>
        <div className="switch">
          End:
          <Switcher
              checked={this.state.endLoadingMore}
              onClick={()=>{
                this.setState({endLoadingMore:!this.state.endLoadingMore})
              }}/>
        </div>
        <LoadingMore show={this.state.showLoadingMore} end={this.state.endLoadingMore} endLocale="Ended"/>

      </div>
    );
  },
  renderImageLoading(){

    return  <div className="image-loading-demo">
              <h3>Real Image</h3>
              {this.state.showImageLoading?<ImageLoading src="https://ununsplash.imgix.net/photo-1433959352364-9314c5b6eb0b?fit=crop&fm=jpg&h=700&q=75&w=1050"/>
                  :<button onClick={()=>{this.setState({showImageLoading: true})}}>Show Normal Image Loading</button>}
              <h3>Wrong Image</h3>
              <ImageLoading src="https://ununsplash.imgix.net" errMsg="失败-重新载入"/>
            </div>
  },
  render: function() {
    return <div className="app">
      <div className="about">
        <h2>Color Chooser</h2>
        {this.renderColorChooser()}
      </div>
      <div className="about">
        <h2>{'<input> copies quickly'}</h2>
        {this.renderCopyarea()}
      </div>
      <div className="about">
        <h2>Loading spots</h2>
        {this.renderLoadingIndicator()}
      </div>
      <div className="about">
        <h2>Switcher</h2>
        {this.renderSwitcher()}
      </div>
      <div className="about">
        <h2>Tabs to switch</h2>
        {this.renderSwitchTabs()}
      </div>
      <div className="about">
        <h2>Wheel events debounced</h2>
        {this.renderWheeling()}
      </div>
      <div className="about">
        <h2>Search Box</h2>
        {this.renderSearchBox()}
      </div>
      <div className="about">
        <h2>Loading More</h2>
        {this.renderLoadingMore()}
      </div>
      <div className="about">
        <h2>Image Loading</h2>
        {this.renderImageLoading()}
      </div>
    </div>
  }
});

ReactDOM.render(<App/>, document.querySelector('.demo'))
