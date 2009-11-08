class Event < ActiveRecord::Base
  EventTypes = [
    "Presidents",
    "Vice Presidents",
    "Prime ministers",
    "Loksabha",
    "Five year plan",
    "CEC",
    "Cheif Justice",
    "Wars",
    "Other"
  ]
  validates_presence_of :name, :from_date, :to_date, :event_type

  def self.find_by_type(event_type, from_year, to_year)
    start_date = Date.new(from_year)
    end_date = Date.new(to_year+1) - 1.day
    self.find(:all, :conditions => ["event_type = ? AND (from_date <= ? AND to_date >= ?)", event_type, end_date, start_date], :order => "from_date ASC")
  end

  def self.events_of_year(year, event_type)
    start_date = Date.new(year)
    end_date = Date.new(year+1) - 1.day
    self.find(:all, :conditions => ["event_type = ? AND (from_date <= ? AND to_date >= ?)", event_type, end_date, start_date], :order => "from_date ASC")
  end

  def duration(to_year)
    if to_year >= self.to_date.year
      (self.to_date - self.from_date).to_i/30
    else
      (Date.new(to_year + 1) - 1.day - self.from_date).to_i/30
    end
  end
  
end
