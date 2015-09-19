SeaStack.Models.Question = Backbone.Model.extend({
  urlRoot: "/api/questions",

  comments: function () {
    this._comments = this._comments ||
    new SeaStack.Collections.QuestionComments([], {question: this});
    return this._comments;
  },

  parse: function (payload) {
    if(payload.comments) {
      this.comments().set(payload.comments, {parse: true});
      delete payload.comments;
    } if (payload.answers) {
      this.answers().set(payload.answers, {parse:true});
      delete payload.comments;
    }
    return payload;
  },

  answers: function () {
    //used to add an answer to a question from the Answerform in question show.
    //also, to initialize a questions answers from a jbuilder fetch
    this._answers = this._answers ||
    new SeaStack.Collections.Answers([],{question: this})
    return this._answers;
  }


});
