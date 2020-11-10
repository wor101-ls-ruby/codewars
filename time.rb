SECONDS_PER_YEAR = 31536000
SECONDS_PER_DAY = 86400
SECONDS_PER_HOUR = 3600
SECONDS_PER_MINUTE = 60

def set_total(seconds, unit)
  years_and_remaining_seconds = [0, seconds]
  
  years_and_remaining_seconds[0] = seconds / unit
  years_and_remaining_seconds[1] = seconds % unit
  
  years_and_remaining_seconds
end

def unit_to_string(unit_total, type_of_unit)
  unit_string = "#{unit_total} #{type_of_unit}"
  unit_total > 1 ? unit_string + 's' : unit_string
end




# **Algorithm**
# 1. create a hash of [years: 0, days: 0, hours: 0, minutes: 0, seconds: 0 ]
# 2. if years equals 1 the set hash[years] to equal '1 year'
# 3. if years is greater than 1 then set hash[years] to equa 'x years'
# 4. repeat steps 2-3 for days, hours minutes, seconds
# 3. turn the values of the hash into an array 
# 4. from the array of values select all that are not 0
# 5. if the arrays size == 1 then return the arry
# 6. if the arrays size == 2 then join the two elemeents with ' and ' and return the array
# 7. if the arrays size > 2
#   - join the last two elements with ' and ' 
#   - join the other elements with ', '
#   - combine both and return

def format_duration(seconds)
  remaining_seconds = seconds
  total_years = 0
  total_days = 0
  total_hours = 0
  total_minutes = 0
  total_seconds = 0
  time_hash = { 'year' => nil, 'day' => nil, 'hour' => nil, 'minute' => nil, 'second' => nil }
  
  total_years, remaining_seconds = set_total(remaining_seconds, SECONDS_PER_YEAR)
  total_days, remaining_seconds = set_total(remaining_seconds, SECONDS_PER_DAY)
  total_hours, remaining_seconds = set_total(remaining_seconds, SECONDS_PER_HOUR)
  total_minutes, total_seconds = set_total(remaining_seconds, SECONDS_PER_MINUTE)

  time_hash['year'] = unit_to_string(total_years, 'year')
  time_hash['day'] = unit_to_string(total_days, 'day')
  time_hash['hour'] = unit_to_string(total_hours, 'hour')
  time_hash['minute'] = unit_to_string(total_minutes, 'minute')
  time_hash['second'] = unit_to_string(total_seconds, 'second')
  
  p time_array = time_hash.values.select { |string| string[0] != '0' }
  
  if time_array.size == 1
    p time_array[0]
  elsif time_array.size == 2
    p time_array.join(' and ')
  elsif time_array.size > 2
    p time_array[0..-2].join(', ') + ' and ' + time_array[-1]
  end
  
end




# **Algorithm**
# 1. Determine total number of years and subtract seconds used from total number of remaining seconds
# 2. Determine total number of days and subtract seconds used from total number of remaining seconds
# 3. Determine total number of hours and subtract seconds used from total number of remaining seconds
# 4. Determine total numbers of minutes and subtract seconds used from total number of remaining seconds
# 5. Set seconds to equal the total number of remaining seconds
# 6. Format string
# 7. return string

# p format_duration(62)    # returns "1 minute and 2 seconds"
# p format_duration(3662)  # returns "1 hour, 1 minute and 2 seconds"
# p format_duration(1) == "1 second"
# p format_duration(62) == "1 minute and 2 seconds"
# p format_duration(120) == "2 minutes"
# p format_duration(3600) == "1 hour")
p format_duration(3662) ==  "1 hour, 1 minute and 2 seconds"
p format_duration(63164660)  == "2 years, 1 day, 1 hour, 44 minutes and 20 seconds"