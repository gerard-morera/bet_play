window.BetVictor = {
  initialize: function() {
    new sportDisplayer();
  }
};

$(document).ready(function(){
  BetVictor.initialize();
});
