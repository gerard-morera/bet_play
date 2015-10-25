var eventDisplayer = Backbone.View.extend({
  el: '.event',

  fetch: function(id) {
    this.$el.empty();
    var self = this
    this.collection = new eventCollection(id);
    this.collection.fetch().then(function(){
      self.render()
    }, function() {
      noRender();
    });
  },
  render: function() {
    this.collection.each(function(evnt) {
      this.renderEvent(evnt);
    }, this);
  },

  renderEvent: function(evnt) {
    var eventV = new eventView({
      model: evnt
    });
    this.$el.append(eventV.render().el);
  },

  noRender: function() {
    debugger
  },

  remove: function() {
    this.$el.hide();
  },

  show: function() {
    this.$el.show();
  }

  // events:{
  //   'click #showsports': 'sportCaller'
  // },

  // sportCaller: function(e) {
  //   debugger;
  //   e.preventDefault();
  //   BetVictor.router.navigate("sports", true);
  // }, 
});