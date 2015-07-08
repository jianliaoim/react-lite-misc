(function() {
  var React, T, cx, div, span;

  React = require('react');

  div = React.createFactory('div');

  span = React.createFactory('span');

  T = React.PropTypes;

  cx = require('classnames');

  module.exports = React.createClass({
    displayName: 'switch-tabs',
    propTypes: {
      data: T.array.isRequired,
      onTabClick: T.func.isRequired,
      tab: T.string.isRequired,
      iconMap: T.object,
      getText: T.func.isRequired
    },
    onTabClick: function(tab) {
      return this.props.onTabClick(tab);
    },
    renderTab: function(tab) {
      var className, icon, onClick;
      className = cx({
        entry: true,
        'is-active': this.props.tab === tab
      });
      onClick = (function(_this) {
        return function() {
          return _this.onTabClick(tab);
        };
      })(this);
      if (this.props.iconMap != null) {
        icon = this.props.iconMap[tab];
      } else {
        icon = void 0;
      }
      return div({
        key: tab,
        className: className,
        onClick: onClick
      }, icon ? span({
        className: "icon icon-" + icon
      }) : void 0, span({
        className: 'text'
      }, tab));
    },
    render: function() {
      var className, classObject;
      classObject = {
        'switch-tabs': true,
        'is-decorated': this.props.iconMap != null
      };
      classObject["col-" + this.props.data.length] = true;
      className = cx(classObject);
      return div({
        className: className
      }, this.props.data.map(this.renderTab));
    }
  });

}).call(this);
