var appRoutes = Backbone.Router.extend({
  routes: {
   "sports/:id/events": "getEvents"
  },

  getEvents: function(e) {
    var eventDisp  = new eventDisplayer;
    eventDisp.fetch(e);
    BetVictor.sportDisp.remove()
  }
});