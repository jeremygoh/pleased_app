class Patient < ActiveRecord::Base
	belongs_to :group
	has_many :comments
	has_many :attends, :dependent => :delete_all
	has_many :meetings, through: :attends
end
