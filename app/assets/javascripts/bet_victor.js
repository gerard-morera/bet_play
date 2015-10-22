window.BetVictor = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new sportsRouter()
    Backbone.history.start()
  }
};

$(document).ready(function(){
  BetVictor.initialize();
});
