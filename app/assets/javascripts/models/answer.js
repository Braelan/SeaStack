SeaStack.Models.Answer = Backbone.Model.extend({
  //root to be used only for create, there is no get method fort answers because
  // the answer is fetched with the question.
  urlRoot: "/api/answers"
})
