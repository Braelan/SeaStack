SeaStack.Views.QuestionShow = Backbone.View.extend({
  template: JST["questions/show"],

  initialize: function (options) {
    this.model = options.model;
    this.collection = options.collection;
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    console.log(this.collection.length)
    var view = this.template({question: this.model})
    this.$el.html(view);
    return this;
  }
})
