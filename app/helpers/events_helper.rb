module EventsHelper
  def event_link(event)
    link_to(event.name, event_path(event), :popup => ['examples','scrollbars=1,resizable=1,width=440,height=510'])
  end
end
