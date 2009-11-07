class Event < ActiveRecord::Base
  EventTypes = [
    "Prime ministers",
    "Presidents",
    "Other"
  ]
  validates_presence_of :name, :from, :to, :event_type

  def self.find_by_type(event_type)
    self.find(:all, :conditions => {:event_type => event_type}, :order => "from ASC")
  end
end
