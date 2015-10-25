var sportDisplayer = Backbone.View.extend({
  el: '.sport',

  initialize: function() {
    var self = this

    this.$el.empty();
    this.show();

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
});