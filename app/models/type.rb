class Type < ActiveRecord::Base
  has_many :events
  validates_presence_of :label
end
