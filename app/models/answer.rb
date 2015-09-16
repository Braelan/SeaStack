class Answer < ActiveRecord::Base
  before_save :default_values
  validates :question_id, :body, presence: true

  belongs_to :question

  def default_values
    self.upvotes ||= 0
  end

end
