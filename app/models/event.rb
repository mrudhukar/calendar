class Event < ActiveRecord::Base
  
  validates_presence_of :name, :from_date, :to_date, :type_id
  belongs_to :type

  def self.find_by_type(event_type, from_year, to_year)
    start_date = Date.new(from_year)
    end_date = Date.new(to_year+1) - 1.day
    self.find(:all, :conditions => ["type_id = ? AND (from_date <= ? AND to_date >= ?)", event_type.id, end_date, start_date], :order => "from_date ASC")
  end

  def duration(to_year)
    if to_year >= self.to_date.year
      (self.to_date - self.from_date).to_i/30
    else
      (Date.new(to_year + 1) - 1.day - self.from_date).to_i/30
    end
  end
  
end
