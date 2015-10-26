var eventDisplayer = Backbone.View.extend({
  el: '.event',

  initialize: function(id) {
    this.$el.empty();
    this.show();
    this.fetch(id);
    this.clean();
  },

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
    this.collection.each(function(event) {
      this.renderEvent(event);
    }, this);
  },

  renderEvent: function(event) {
    var eventV = new eventView({
      model: event
    });
    this.$el.append(eventV.render().el);
  },

  clean: function() {
    if(app.sport_displayer){
      app.sport_displayer.remove();
    } 
    if(app.outcome_displayer) {
      app.outcome_displayer.remove();
    }
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