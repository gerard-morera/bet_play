var sportDisplayer = Backbone.View.extend({
el: '#sports',

initialize: function() {
this.collection = new sportCollection();
this.collection.fetch();
this.render();
},

// render library by rendering each book in its collection
render: function() {
  this.collection.each(function( sport ) {
    this.renderSport( sport );
  }, this );
},

// render a book by creating a BookView and appending the
// element it renders to the library's element
renderSport: function( sport ) {
  var sportView = new sportView({
      model: sport
  });
  this.$el.append( sportView.render().el );
}
});