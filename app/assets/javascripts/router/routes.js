var appRoutes = Backbone.Router.extend({
  routes: {
   "sports/:id/events": "getEvents",
   "sports/:sport_id/events/:event_id/outcomes": "getOutcomes"
  },

  getEvents: function(e) {
    BetVictor.eventDisp  = new eventDisplayer;
    
    BetVictor.eventDisp.fetch(e);
    BetVictor.sportDisp.remove();
  },

  getOutcomes: function(sport_id, event_id) {
    var outcomeDisp  = new outcomeDisplayer;

    outcomeDisp.fetch(sport_id, event_id);
    BetVictor.eventDisp.remove();
  }
});