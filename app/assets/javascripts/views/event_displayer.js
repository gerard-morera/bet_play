var eventDisplayer = Backbone.View.extend({
  el: '.event',

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
    this.collection.each(function(ev) {
      this.renderEvent(ev);
    }, this);
  },

  renderEvent: function(ev) {
    var eventV = new eventView({
      model: ev
    });
    this.$el.append(eventV.render().el);
  },

  noRender: function() {
    debugger
  },

  remove: function() {
    this.$el.hide();
  }
});