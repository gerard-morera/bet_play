var appRoutes = Backbone.Router.extend({
  routes: {
    "sports": "getSports",
    "sports/:id/events": "getEvents",
    "sports/:sport_id/events/:event_id/outcomes": "getOutcomes"
  },

  getSports: function() {
    BetVictor.sportDisp = new sportDisplayer();
    BetVictor.sportDisp.show();

    if(BetVictor.eventDisp){
      BetVictor.eventDisp.remove();
    } 
    if(BetVictor.outcomeDisp) {
      BetVictor.outcomeDisp.remove();
    }
  },

  getEvents: function(id) {
    BetVictor.eventDisp  = new eventDisplayer();
    BetVictor.eventDisp.show();

    BetVictor.eventDisp.fetch(id);

    if(BetVictor.sportDisp){
      BetVictor.sportDisp.remove();
    } 
    if(BetVictor.outcomeDisp) {
      BetVictor.outcomeDisp.remove();
    }
  },

  getOutcomes: function(sport_id, event_id) {
    BetVictor.outcomeDisp  = new outcomeDisplayer;
    BetVictor.outcomeDisp.show();
    BetVictor.outcomeDisp.fetch(sport_id, event_id);

    if(BetVictor.sportDisp){
      BetVictor.sportDisp.remove();
    } 
    if(BetVictor.eventDisp) {
      BetVictor.eventDisp.remove();
    }
  }
});