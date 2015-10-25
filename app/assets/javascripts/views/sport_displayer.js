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
  }

  // events:{
  //   'click #showEvents':'eventcaller'
  // },

  // eventcaller: function(e) {
  //   e.preventDefault(e);

  //   id = $(e.currentTarget).attr("eventid")

  //   BetVictor.routes.route("sports/:id/events")
  //   // BetVictor.eventDisp.fetch(eventId)
  // }
});