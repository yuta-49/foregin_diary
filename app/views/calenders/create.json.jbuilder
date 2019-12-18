json.array!(@calender) do |calender|
  json.id       calender.id
  json.title    calender.title
  json.start    calender.start   
  json.end      calender.end
  json.url      event_url(calender, format: :html) 
end