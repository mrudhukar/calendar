class Event < ActiveRecord::Base
  EventTypes = [
    "Prime ministers",
    "Presidents"
  ]
  validates_presence_of :name, :from, :to, :event_type
end
