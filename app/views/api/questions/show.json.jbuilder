

json.extract! @question,
:id,
:title,
:body,
:user_id,
:upvotes,
:filepicker_url,
:created_at,
:updated_at,
:response_notification

json.comments do
  json.array! @comments  do |comment|
    json.extract! comment, :id, :body
  end
end
# json.array!(@comments)

json.answers do
  json.array! @answers do |answer|
    json.extract! answer, :id, :body, :upvotes, :user_id, :link_url
  end
end
  # upvote would be better named vote because it can be up or down.
  count = 0
  @question.upvotes.each do |vote|
      if vote.value == false
        count -= 1
      end

      if vote.value == true
        count +=1
      end
    end

json.set! :votes, count
