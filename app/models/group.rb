class Group < ActiveRecord::Base
  validates :name, presence: true
  has_many :patients
  has_many :users
  has_many :meetings


end
