class Comment < ActiveRecord::Base
  validates :comment, presence: true

  belongs_to :meeting
  belongs_to :user
  belongs_to :patient

  validates :user, presence: true
  validates :patient, presence: true
end
