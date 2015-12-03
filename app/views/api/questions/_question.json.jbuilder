json.(question,
:id,
:title,
:body,
:user_id,
:upvotes,
:created_at,
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
