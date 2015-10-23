var sportView = Backbone.View.extend({
  tagName:   'div',
  className: 'sportContainer',
  template: _.template("<%= title %>"),

  render: function() {
    this.$el.html(this.template( this.model.attributes));
    return this;
  }
});