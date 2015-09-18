

json.extract! @question,
:id,
:title,
:body,
:user_id,
:upvotes,
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
