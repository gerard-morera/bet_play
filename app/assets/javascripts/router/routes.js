var appRoutes = Backbone.Router.extend({
  routes: {
    "sports": "getSports",
    "sports/:id/events": "getEvents",
    "sports/:sport_id/events/:event_id/outcomes": "getOutcomes"
  },

  getSports: function() {
    app.sport_displayer = new sportDisplayer();
  },

  getEvents: function(id) {
    app.event_displayer  = new eventDisplayer(id);
  },

  getOutcomes: function(sport_id, event_id) {
    app.outcome_displayer  = new outcomeDisplayer(sport_id, event_id);
  }
});