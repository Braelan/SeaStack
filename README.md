# Stack Overflow Clone

[Heroku link][heroku]

[heroku]: http://flux-capacitr.herokuapp.com

## Minimum Viable Product
Stack Overflow Clone is a clone of Stack Overflow built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->
- [ ] create CSS stylesheet
- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Create questions
- [ ] Create answers
- [ ] View questions with answers
- [ ] upvote questions
- [ ] upvote answers
- [ ] make questions searchable
- [ ] Add special user priveledges if benchmarks are reached
- [ ]

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Blog Creation (~1 day)
  Create an authentiation system where users sign in and have accounts.  Users have many questions, and answers, also upvotes.  Push to Heroku

[Details][phase-one]

### Phase 2: Viewing Questions and Answers (~2 days)
I will add API routes to serve question and answer data as JSON, then add Backbone
models and collections that fetch data from those routes. By the end of this
phase, users will be able to create questions and answer both questions and answers, all
inside a single Backbone app.

[Details][phase-two]

### Phase 3: Editing and Displaying Posts (~2 days)
Users may edit their own posts and questions.  super users have editing priveledges on others' questions.

[Details][phase-three]

### Phase 4: User emails (~1-2 days)
  I will have an optional feature that sends an email to the writer if one of their subscribed posts has been responded to.

[Details][phase-four]

### Phase 5: Searching for Blogs and Posts (~2 days)
I'll need to add `search` routes to both the Questions and Answers controllers. On the
Backbone side, there will be a `SearchResults` composite view has `QuestionsIndex`
and `AnswersIndex` subviews. These views will use plain old `question` and `answer`
collections, but they will fetch from the new `search` routes.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] subject tags
- [ ] user avatar
- [ ]sort by age
- [ ] sort by votes
- [ ] search for related posts
- [ ] have a related column
- [ ] limit priveledges or ban users
- [ ] user badges
- [ ] clone of the entire app for specific subjects

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md


<!-- Question.create!(title: "Has it been a good year?", body: "explain", user_id: 1) -->
<!-- rm ~/.ssh/id_rsa.pub
heroku login
ssh-keygen -t rsa -b 4096 -C "bbraelan@gmail.com"
heroku keys:add
git remote add heroku git@heroku.com:pure-coast-4988.git
git push heroku master
heroku open -->
