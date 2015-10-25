var outcomeCollection = Backbone.Collection.extend({
  initialize: function(event_id, sport_id) {
    this.event_id = event_id
    this.sport_id = sport_id
  },

  model: outcomeModel,

  url: function() {
    return ('/sports/' + this.sport_id + '/events/' + this.event_id + '/outcomes');
  }
});
