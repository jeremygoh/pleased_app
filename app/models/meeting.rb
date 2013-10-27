class Meeting < ActiveRecord::Base
  has_many :attends, :dependent => :delete_all
  has_many :patients, through: :attends
  belongs_to :group
end
