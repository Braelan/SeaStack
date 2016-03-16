# SeaStack

A forum for discussing the seaweed industry inspired by StackOverflows question
and answer format.

[Seastack Live] (https://pure-coast-4988.herokuapp.com/#questions)


## Features
  - Question forum sorted by most recent or by upvotes
  - Accounts track user posts and comments.
  - Post questions, answer questions and comment
  - upload photos
  - upvote questions
  - Text Search for questions
  - Tags
  - Hand Rolled CSS
  - Restful Api


## Technology
  Ruby on Rails, Backbone.js, PGSQL, Jquery, CSS, BCrypt


## Code example for javascript comparator by most recent post
```JavaScript
comparator: function(model){
  var updates = model.escape('updated_at').split('T');
  var date = updates[0].split("-");
  var total = parseInt(date[0])*1000000 + parseInt(date[1])*10000 + parseInt(date[2])*1000
  var time = updates[1].split(":")
  total = total + parseInt(time[0])*60 + parseInt(time[1])
  return -total;
}
```


<!-- rm ~/.ssh/id_rsa.pub
heroku login
ssh-keygen -t rsa -b 4096 -C "bbraelan@gmail.com"
heroku keys:add
git remote add heroku git@heroku.com:pure-coast-4988.git
git push heroku master
heroku open -->
