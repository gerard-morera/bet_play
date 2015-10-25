var outcomeDisplayer = Backbone.View.extend({
  el: '.outcome',

  fetch: function(event_id, sport_id) {
    var self = this

    this.collection = new outcomeCollection(event_id, sport_id);
    this.collection.fetch().then(function(){
      self.render()
    }, function() {
      noRender();
    });
  },
  render: function() {
    this.collection.each(function(outcome) {
      this.renderEvent(outcome);
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
  }
});