var outcomeView = Backbone.View.extend({
  tagName:   'div',
  className: 'outcomeContainer',

  initialize: function() {
    this.template = _.template($('#outcomeTemplate').html());
  },

  render: function() {  
    this.$el.html(this.template(this.model.attributes));
    return this;
  }
});