(function() {
  var React, div;

  React = require('react');

  div = React.createFactory('div');

  module.exports = React.createClass({
    displayName: 'loading-indicator',
    render: function() {
      return div({
        className: 'loading-indicator'
      }, div({
        className: 'loader-dot'
      }), div({
        className: 'loader-dot'
      }), div({
        className: 'loader-dot'
      }));
    }
  });

}).call(this);
