var appRoutes = Backbone.Router.extend({
  routes: {
   "sports/:id/events": "getEvents"
  },

  getEvents: function(e) {
    eventDisp = new eventDisplayer
    eventDisp.fetch(e)
  }

});