var eventDisplayer = Backbone.View.extend({

  fetch: function(id) {
    var self = this
    this.collection = new eventCollection(id);
    this.collection.fetch().then(function(){
      self.render()
    }, function() {
      noRender();
    });
  },
  render: function() {
    debugger
  },

  noRender: function() {
    debugger
  }
});