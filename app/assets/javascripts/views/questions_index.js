SeaStack.Views.QuestionsIndex = Backbone.View.extend({
  template: JST["questions/index"],

  events: {
    "click .recent" : "recent",
    "click .by-votes" : "votes"
  },

  initialize: function (options) {
    this.collection = options.collection;
    this.collection.label = "votes";
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    this.collection.sort();
    var view = this.template({questions: this.collection});
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

     }



})
