(function() {
  var React, T, cx, div;

  React = require('react');

  div = React.createFactory('div');

  T = React.PropTypes;

  cx = require('classnames');

  module.exports = React.createClass({
    displayName: 'switch-button',
    propTypes: {
      checked: T.bool.isRequired,
      onClick: T.func.isRequired
    },
    onClick: function() {
      return this.props.onClick(!this.props.checked);
    },
    render: function() {
      return div({
        className: cx({
          'switch-button': true,
          'is-checked': this.props.checked
        }),
        onClick: this.onClick
      }, div({
        className: 'inner-button'
      }, this.props.checked));
    }
  });

}).call(this);
