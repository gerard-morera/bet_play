var sportDisplayer = Backbone.View.extend({
  el: '.sport',

  initialize: function() {
    this.$el.empty();
    this.show();
    this.cleanOtherViews();
    this.fetch();
  },

  fetch: function() {
    var self = this

    this.collection = new sportCollection();
    this.collection.fetch().then(function(){
    self.render()
    });
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

  cleanOtherViews: function() {
    if(app.event_displayer){
      app.event_displayer.remove();
    } 
    if(app.outcome_displayer) {
      app.outcome_displayer.remove();
    }
  },

  remove: function() {
    this.$el.hide();
  },

  show: function() {
    this.$el.show();
  }
});