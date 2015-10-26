SeaStack.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],

  events: { "click #upvote": "vote",
            "click #downvote": "vote"
  },

  initialize: function (options) {
    //model is a question
    this.model = options.model;
    this.collection = options.collection;
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(this.collection, "sync", this.render)
     this.listenTo(this.model.answers(), "sync", this.render)
     this.listenTo(this.model.comments(), "sync", this.render)
  },

  render: function () {
    var view = this.template({question: this.model})
    this.$el.html(view);
    this.addAnswerForm();
    this.addCommentForm();
    return this;
  },

  addAnswerForm: function () {
    var blankAnswer = new SeaStack.Models.Answer();
    var answerForm = new SeaStack.Views.AnswerForm({question: this.model, answer: blankAnswer, collection: this.model.answers()})
    this.addSubview(".answerForm", answerForm )
  },

  addCommentForm: function () {
    var blankComment = new SeaStack.Models.Comment();
    var commentForm = new SeaStack.Views.CommentForm({question: this.model, comment: blankComment, collection: this.model.comments()});
    this.addSubview(".commentForm", commentForm);
  },

  vote: function (event) {
    event.preventDefault();
    var attrs = $('#upvote').serializeJSON();
    if (event.toElement.outerText === "DOWN") {
      attrs = $('#downvote').serializeJSON();
    }
    var that = this;
    var vote = new SeaStack.Models.Upvote();
    vote.set(attrs);
    vote.save({}, {
      success: function(){
        that.model.fetch();
      },
      error: function(model, response) {
        console.log(response.responseText)
        window.alert("Please Login to Vote.")
      }
    });

  }




})
