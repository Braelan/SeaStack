class Question < ActiveRecord::Base
  before_save :default_values
  validates :title, :body, presence: true, uniqueness: true
  validates :user_id, presence: true
  has_many :comments

  has_many :answers

  def default_values
    self.upvotes ||= 0;
  end

end
