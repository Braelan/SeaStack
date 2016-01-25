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

  // set default comparator to votes or most recent

  // comparator: function(model) {
  //   return -(model.attributes.upvotes.length)
  // },

  comparator: function(model){
    var updates = model.escape('updated_at').split('T');
    var date = updates[0].split("-");
    var total = parseInt(date[0])*1000000 + parseInt(date[1])*10000 + parseInt(date[2])*1000
    var time = updates[1].split(":")
    total = total + parseInt(time[0])*60 + parseInt(time[1])
    return -total;
  }


});
