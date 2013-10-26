class Attend < ActiveRecord::Base
  belongs_to :patient
  belongs_to :meeting
end
