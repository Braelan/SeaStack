SeaStack.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],
  initialize: function (options) {
    //model is a question
    this.model = options.model;
    this.collection = options.collection;
    this.listenTo(this.model, "sync", this.render)
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    console.log(this.collection.length)
    var view = this.template({question: this.model})
    this.$el.html(view);
    this.addAnswerForm();
    return this;
  },

  addAnswerForm: function () {
    var blankAnswer = new SeaStack.Models.Answer();
    var answerForm = new SeaStack.Views.AnswerForm({question: this.model, answer: blankAnswer, collection: this.model.answers()})
    this.addSubview(".answerForm", answerForm )
  },





})
