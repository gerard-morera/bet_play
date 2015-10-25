window.BetVictor = {
  initialize: function() {
    this.sportDisp = new sportDisplayer();
    
    router = new appRoutes();
    Backbone.history.start()
  },
};

$(document).ready(function(){
  BetVictor.initialize();
});
