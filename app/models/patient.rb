class Patient < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  belongs_to :group
  has_many :comments
  has_many :attends, :dependent => :delete_all
  has_many :meetings, through: :attends
end
