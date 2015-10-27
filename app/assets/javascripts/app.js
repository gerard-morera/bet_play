window.app = {
  initialize: function() {
    this.router = new appRoutes();
    Backbone.history.start()

    this.router.navigate("sports", true)
  },
};

$(document).ready(function(){
  app.initialize();
});
