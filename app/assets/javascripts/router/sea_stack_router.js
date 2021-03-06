SeaStack.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "splash",
    "questions" : "index",
    "questions/new" : "new",
    "questions/:id" : "show"
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection= SeaStack.questions;
    this.tags = SeaStack.tags;
  },

  index: function() {
    var view = new SeaStack.Views.QuestionsIndex({collection: this.collection, tags: this.tags});
    this._swapView(view)
  },

  splash: function () {
    var view = new SeaStack.Views.Splash();
    this._swapView(view);
  },

  show: function (id) {
    var model = this.collection.getOrFetch(id)
    var view = new SeaStack.Views.QuestionShow({model: model, collection: this.collection});
    this._swapView(view)
  },

  new: function () {
    var model = new SeaStack.Models.Question()
    var view = new SeaStack.Views.QuestionForm({model: model, collection: this.collection})
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }

});
