SeaStack.Collections.Questions = Backbone.Collection.extend({
  model: SeaStack.Models.Question,
  url: "/api/questions",

  getOrFetch: function (id) {
    var question = this.get(id)
    var questions = this;

    if (!question) {
      question = new SeaStack.Models.Question({id: id});
      question.fetch({
        success: function () {
          questions.add(question);
        }
      })
    } else {
      question.fetch();
    }
    return question
  },

  comparator: function(model) {
    return -(model.attributes.upvotes.length)
  }

});
