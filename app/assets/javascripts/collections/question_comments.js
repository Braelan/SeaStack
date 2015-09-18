SeaStack.Collections.QuestionComments = Backbone.Collection.extend({
  model: SeaStack.Models.QuestionComment,

  initialize: function (models, options) {
    this.question = options.question
  }
})
