SeaStack.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],

  initialize: function (options) {
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    var view = this.template({questions: this.collection});
    this.$el.html(view);
    return this;
  }



})
