module ApplicationHelper
  def time_ago_in_words(from_time, options = {})
    time_ago = distance_of_time_in_words(Time.zone.now, from_time, options)

    number, unit = time_ago.match(/(\d+) (\w+)/).captures

    number = "1" if number == "about"

    "#{number} #{unit}"
  end
end
