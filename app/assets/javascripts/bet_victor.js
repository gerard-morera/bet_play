window.BetVictor = {
  initialize: function() {
    new sportDisplayer();
    
    router = new appRoutes();
    Backbone.history.start()
  },
};

$(document).ready(function(){
  BetVictor.initialize();
});
