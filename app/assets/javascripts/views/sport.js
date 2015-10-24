var sportView = Backbone.View.extend({
  tagName:   'div',
  className: 'sportContainer',

  initialize: function() {
    this.template = _.template($('#sportTemplate').html());
  },

  render: function() {
    this.$el.html(this.template(this.model.attributes));
    return this;
  }
});