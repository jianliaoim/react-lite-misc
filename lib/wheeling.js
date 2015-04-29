(function() {
  var React, T, debounce, div;

  React = require('react');

  debounce = require('./debounce');

  div = React.createFactory('div');

  T = React.PropTypes;

  module.exports = React.createClass({
    displayName: 'wheeling',
    propTypes: {
      onScroll: T.func.isRequired
    },
    componentDidMount: function() {
      this._rootEl = this.getDOMNode();
      return this.debounceDetect = debounce(this.detect, 400);
    },
    onWheel: function(evet) {
      return this.debounceDetect(event);
    },
    detect: function(event) {
      var info;
      info = {
        atTop: this._rootEl.scrollTop === 0,
        atBottom: (this._rootEl.scrollTop + this._rootEl.clientHeight) === this._rootEl.scrollHeight,
        goingUp: event.deltaY < 0,
        goingDown: event.deltaY > 0
      };
      return this.props.onScroll(info);
    },
    render: function() {
      return div({
        className: 'wheeling',
        onWheel: this.onWheel
      }, this.props.children);
    }
  });

}).call(this);
