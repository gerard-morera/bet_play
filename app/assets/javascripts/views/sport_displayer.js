var sportDisplayer = Backbone.View.extend({
  el: '.sport',

  initialize: function() {
    var self = this
    this.collection = new sportCollection();
    this.collection.fetch().then(function(){
    self.render()});
  },

  render: function() {
    this.collection.each(function(sport) {
      this.renderSport(sport);
    }, this);
  },

  renderSport: function(sport) {
    var sportV = new sportView({
      model: sport
    });
    this.$el.append(sportV.render().el);
  },

  remove: function() {
    this.$el.hide();
  },

  show: function() {
    this.$el.show();
  }

  // events: {
  //   'click #showsports': 'sportCaller',
  //   'click #showEvents': 'eventCaller'
  // },

  // sportCaller: function(e) {
  //   debugger;
  //   e.preventDefault();
  //   BetVictor.router.navigate("sports", true);
  // }, 

  // eventCaller: function(e) {
  //   e.preventDefault(e);

  //   this.id = $(e.currentTarget).attr("eventid")
  //   BetVictor.router.navigate("sports/" + this.id + "/events", true)
  // }
});