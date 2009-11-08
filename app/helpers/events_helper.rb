module EventsHelper
  def event_link(event)
    link_to(event.name, event_path(event), :popup => ['examples','scrollbars=1,resizable=1,width=440,height=510'])
  end

  def td_for_year(year, event_type)
    events = Event.events_of_year(year, event_type)
    return no_event_year if events.empty?
    content = ""

    events.each_with_index do |event, i|
      if event.from_date.year < year && event.to_date.year > year
        content += full_year(event)
      else
        if event.from_date.year == year
          content += content_tag(:td, "-", :colspan=>"#{event.from_date.month}") if i == 0
          content += content_tag(:td, :colspan=>"#{12 - event.from_date.month}", :style => "background-color: #{event.color}") do
            event_link(event)
          end
        end
        if event.to_date.year == year
          content += content_tag(:td, :colspan=>"#{event.to_date.month}", :style => "background-color: #{event.color}") do
            event_link(event)
          end
          content += content_tag(:td, "-", :colspan=>"#{12 - event.to_date.month}") if i+1 == events.size
        end
      end
    end
    return content
  end

  def full_year(event)
    content_tag(:td, :style => "background-color: #{event.color}", :colspan=>"12") do
      event_link(event)
    end
  end

  def no_event_year
    content_tag(:td, "-", :colspan=>"12")
  end
end
