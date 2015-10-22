

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
    json.extract! answer, :id, :body, :upvotes, :user_id
  end
end
  # upvote would be better named vote because it can be up or down.

json.votes do
  count = 0
  @question.upvotes.each do |vote|
      if vote.value == false
        count -= 1
      end

      if vote.value == true
        count +=1
      end
    end
    total_count = {count: count}
    json.extract! total_count, :count
  end
