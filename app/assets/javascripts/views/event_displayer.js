var eventDisplayer = Backbone.View.extend({
  el: '.event',

  initialize: function(id) {
    this.$el.empty();
    this.show();
    this.fetch(id);
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