class Tag < ActiveRecord::Base
  validates :question_id, :category, presence: true
end
