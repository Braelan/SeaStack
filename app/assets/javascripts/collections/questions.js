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
  },

  // comparator: function(model){
  //   var updates = model.escape('updated_at').split('T')[0];
  //   var date = updates.split("-");
  //   debugger
  //   var total = parseInt(date[0])*10000 + parseInt(date[1])*100 + parseInt(date[2]);
  //   return -total;
  // }


});
