SeaStack.Views.QuestionShow = Backbone.View.extend({
  template: JST["questions/show"],

  initialize: function (options) {
    debugger
    this.model = options.model;
    this.comments = options.comments
    this.collection = options.collection;
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    console.log(this.collection.length)
    debugger
    var view = this.template({comments: this.comments, question: this.model})
    this.$el.html(view);
    return this;
  }
})
