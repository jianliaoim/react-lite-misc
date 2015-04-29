(function() {
  var React, T, cx, div, span;

  React = require('react');

  div = React.createFactory('div');

  span = React.createFactory('span');

  T = React.PropTypes;

  cx = require('classnames');

  module.exports = React.createClass({
    displayName: 'color-chooser',
    propTypes: {
      data: T.object.isRequired,
      onColorClick: T.func.isRequired,
      chosen: T.string.isRequired
    },
    onColorClick: function(color) {
      return this.props.onColorClick(color);
    },
    renderIcons: function(color, name) {
      var names;
      names = Object.keys(this.props.data);
      return names.map((function(_this) {
        return function(name) {
          var className, onClick, style;
          color = _this.props.data[name];
          className = cx('color-icon', 'icon', {
            'icon-tick': _this.props.chosen === name,
            'is-chosen': _this.props.chosen === name
          });
          style = {
            backgroundColor: color || '#ff9800'
          };
          onClick = function() {
            return _this.onColorClick(name);
          };
          return span({
            key: name,
            className: className,
            style: style,
            onClick: onClick
          });
        };
      })(this));
    },
    render: function() {
      return div({
        className: 'color-chooser'
      }, this.renderIcons());
    }
  });

}).call(this);
