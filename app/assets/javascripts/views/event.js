var eventView = Backbone.View.extend({
  tagName:   'div',
  className: 'eventContainer',

  initialize: function() {
    this.template = _.template($('#eventTemplate').html());
  },

  render: function() {
    this.$el.html(this.template(this.model.attributes));
    return this;
  }
});