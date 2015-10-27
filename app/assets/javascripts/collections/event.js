var eventCollection = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id
  },

  model: eventModel,

  url: function() {
    return ('/sports/' + this.id + '/events');
  }
});
