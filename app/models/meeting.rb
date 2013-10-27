class Meeting < ActiveRecord::Base
  has_many :attends, :dependent => :delete_all
  has_many :patients, through: :attends
  has_many :users, through: :group
  has_many :comments
  belongs_to :group

  validates :group, presence: true


end
