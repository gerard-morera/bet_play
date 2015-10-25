var outcomeDisplayer = Backbone.View.extend({
  el: '.outcome',

  fetch: function(sport_id, event_id) {
    var self = this

    this.collection = new outcomeCollection(sport_id, event_id);
    this.collection.fetch().then(function(){
      self.render()
    }, function() {
      noRender();
    });
  },
  render: function() {
    this.collection.each(function(outcome) {
      this.renderOutcome(outcome);
    }, this);
  },

  renderOutcome: function(outcome) {
    var outcomeV = new outcomeView({
      model: outcome
    });
    this.$el.append(outcomeV.render().el);
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
});