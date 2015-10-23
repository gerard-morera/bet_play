var sportDisplayer = Backbone.View.extend({
  el: '.sports',

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

  renderSport: function( sport ) {
    var sportV = new sportView({
      model: sport
    });
    this.$el.append(sportV.render().el);
  }
});