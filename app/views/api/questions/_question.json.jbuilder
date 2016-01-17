json.(question,
:id,
:title,
:body,
:user_id,
:upvotes,
:updated_at,
:response_notification)
json.set! :answercount, question.answers.length
  # upvote would be better named vote because it can be up or down.
  count = 0
  question.upvotes.each do |vote|
      if vote.value == false
        count -= 1
      end

      if vote.value == true
        count +=1
      end
    end

json.set! :votes, count



def taglist(question)
  taglist = []
  question.tags.each do |tag|
    taglist << tag.category
  end
  taglist
end

json.set! :tags, taglist(question)

def author(question)
  question.user.name
end

json.set! :author, author(question)

def format_date(question)
  question.created_at.to_formatted_s(:short)
end

json.set! :created_at, format_date(question)
