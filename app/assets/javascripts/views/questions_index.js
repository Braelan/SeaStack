SeaStack.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],


  events: {
    "click .recent" : "recent",
    "click .by-votes" : "votes",
    "submit .search-form" : "search",
    "click .all-questions" : "all_questions",
    "click .index-tag" : "tag",
    "click .unanswered" : "unanswered"
  },

  initialize: function (options) {
    this.collection = options.collection;
    this.fullCollection = options.collection;
    this.tags = options.tags;
    this.collection.label = "recent";
    this.listenTo(this.collection, "sync", this.render)
    this.listenTo(this.tags, "sync", this.render)
  },

  render: function () {
    this.collection.sort();
    var view = this.template({questions: this.collection, tags: this.tags});
    this.$el.html(view);
    this.handleTabs();
    return this;
  },

  recent: function() {
    if (this.collection.label !== "recent") {
      this.collection.comparator = function(model){
        var updates = model.escape('updated_at').split('T');
        var date = updates[0].split("-");
        var total = parseInt(date[0])*1000000 + parseInt(date[1])*10000 + parseInt(date[2])*1000
        var time = updates[1].split(":")
        total = total + parseInt(time[0])*60 + parseInt(time[1])
        return -total;
      }
      this.collection.label = "recent"
      this.render();
    }

  },

  votes: function() {
    if (this.collection.label !== "votes") {
      this.collection.comparator = function(model) {
        return -(model.attributes.upvotes.length)
      }
      this.collection.label = "votes"
      this.render();

    }
  },

    handleTabs: function() {
      if(this.collection.label === "votes" && $(".by-votes > .index-on").length === 0) {
              $(".by-votes > button").toggleClass("index-on")
              $(".recent > button").toggleClass("index-on")

      } else if (this.collection.label === "recent" && $(".recent > .index-on").length === 0) {
                $(".by-votes > button").toggleClass("index-on")
                $(".recent > button").toggleClass("index-on")
      }

    },

    search: function(event){
      event.preventDefault();
      var query = this.$(".search-form").serializeJSON();
      var that = this;
      this.collection = this.fullCollection
      this.collection.fetch({data: $.param(query)})

    },

    all_questions: function(event){
      var that = this
      this.collection.fetch({
        success: function() {
          that.render();
        }
      });
    },
// get all of the questions with a given tag
    tag: function(event) {
      var that = this;
      this.collection.fetch({
        success: function() {
          var tag = $(event.toElement).text().trim();
          var questions = that.fullCollection;
          var tagQuestions = new SeaStack.Collections.Questions()

          for (var i = 0; i < questions.length; i++) {
            if (questions.models[i].attributes.tags.indexOf(tag) !== -1) {
              tagQuestions.add(questions.models[i])
            }
          }
          that.collection = tagQuestions
          that.render();
        }
      })

    },

    unanswered: function(event){
      var questions = this.fullCollection.where({answercount: 0});
      questions = new SeaStack.Collections.Questions(questions)
      this.collection = questions;
      this.render();
    }



})
