var outcomeDisplayer = Backbone.View.extend({
  el: '.outcome',

  initialize: function(sport_id, event_id) {
    this.$el.empty();
    this.show();
    this.fetch(sport_id, event_id);
    this.clean()
  },

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

  clean: function() {
    if(app.sport_displayer){
      app.sport_displayer.remove();
    } 
    if(app.event_displayer) {
      app.event_displayer.remove();
    }
  },

  remove: function() {
    this.$el.hide();
  },

  show: function() {
    this.$el.show();
  }
});