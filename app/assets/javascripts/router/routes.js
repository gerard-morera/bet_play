var appRoutes = Backbone.Router.extend({
  routes: {
    "sports": "getSports",
    "sports/:id/events": "getEvents",
    "sports/:sport_id/events/:event_id/outcomes": "getOutcomes"
  },

  getSports: function() {
    app.sport_displayer = new sportDisplayer();

    if(app.event_displayer){
      app.event_displayer.remove();
    } 
    if(app.outcome_displayer) {
      app.outcome_displayer.remove();
    }
  },

  getEvents: function(id) {
    app.event_displayer  = new eventDisplayer();

    app.event_displayer.fetch(id);

    if(app.sport_displayer){
      app.sport_displayer.remove();
    } 
    if(app.outcome_displayer) {
      app.outcome_displayer.remove();
    }
  },

  getOutcomes: function(sport_id, event_id) {
    app.outcome_displayer  = new outcomeDisplayer;

    app.outcome_displayer.fetch(sport_id, event_id);

    if(app.sport_displayer){
      app.sport_displayer.remove();
    } 
    if(app.event_displayer) {
      app.event_displayer.remove();
    }
  }
});