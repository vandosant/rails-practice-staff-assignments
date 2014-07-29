class Assignment < ActiveRecord::Base
  belongs_to :location
  validates :role, uniqueness: {scope: :location}
end