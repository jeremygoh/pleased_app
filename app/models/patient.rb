class Patient < ActiveRecord::Base
	has_one :group
	has_many :comments
	has_many :attends, :dependent => :delete_all
	has_many :meetings, through: :attends
end
