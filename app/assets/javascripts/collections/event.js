var eventCollection = Backbone.Collection.extend({
  initialize: function(id) {
    this.id = id
  },

  model: eventModel,

  url: function() {
    debugger;
    return ('/sports/' + this.id + '/events');
  }
});
