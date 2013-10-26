class Patient < ActiveRecord::Base
	has_one :group
	has_many :comments
end
