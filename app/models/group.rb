class Group < ActiveRecord::Base
has_many :patients
has_many :users
end
