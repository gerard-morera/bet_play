var sportView = Backbone.View.extend({
  tagName:   'div',
  className: 'sportContainer',
  template: _.template( $( '#sportTemplate' ).html() ),

  render: function() {
    this.$el.html( this.template( this.model.attributes ) );

    return this;
  }
});