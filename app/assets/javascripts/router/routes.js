var appRoutes = Backbone.Router.extend({
  routes: {
    "sports": "getSports",
    "sports/:id/events": "getEvents",
    "sports/:sport_id/events/:event_id/outcomes": "getOutcomes"
  },

  getSports: function() {
    app.sportDisp = new sportDisplayer();
    app.sportDisp.show();

    if(app.eventDisp){
      app.eventDisp.remove();
    } 
    if(app.outcomeDisp) {
      app.outcomeDisp.remove();
    }
  },

  getEvents: function(id) {
    app.eventDisp  = new eventDisplayer();
    app.eventDisp.show();

    app.eventDisp.fetch(id);

    if(app.sportDisp){
      app.sportDisp.remove();
    } 
    if(app.outcomeDisp) {
      app.outcomeDisp.remove();
    }
  },

  getOutcomes: function(sport_id, event_id) {
    app.outcomeDisp  = new outcomeDisplayer;
    app.outcomeDisp.show();
    app.outcomeDisp.fetch(sport_id, event_id);

    if(app.sportDisp){
      app.sportDisp.remove();
    } 
    if(app.eventDisp) {
      app.eventDisp.remove();
    }
  }
});