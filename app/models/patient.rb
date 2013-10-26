class Patient < ActiveRecord::Base
	has_one :group
end
