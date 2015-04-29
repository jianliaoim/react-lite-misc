(function() {
  var React, T, input;

  React = require('react');

  input = React.createFactory('input');

  T = React.PropTypes;

  module.exports = React.createClass({
    displayName: 'copyarea',
    propTypes: {
      text: T.string.isRequired
    },
    componentDidMount: function() {
      return this.getDOMNode().select();
    },
    onEnter: function(event) {
      return event.target.select();
    },
    render: function() {
      return input({
        className: 'copyarea form-control',
        readOnly: true,
        onMouseEnter: this.onEnter,
        value: this.props.text
      });
    }
  });

}).call(this);
