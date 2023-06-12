=begin
P:
- Same day of the week
- Construct objects that represent meetup date
- Take month no and year and return date

E:
Input: 2nd Wednesday of May 2021
Return: 12th of May, 2021

Input: month no (int), year (int)
Output: num

E:

A:
- Create Meetup class
- Create constructor method with two ints as parameters (year, month)
  - Set to instance variables
- Create instance method #day with two string parameters (day of the week, occurrence)
  - Determine day number with day_num instance method
  - return Date or nil if day_num not found
- Create instance method #find_day_num with two string parameters (dotw, occurrence)
  - Create counter = 1
  - Loop from 1 to Date.civil(year, month, -1).day
    - If statements => dotw string == [dotw] and current date is [dotw]
      - If we are on the correct occurrence, return day_num
      - Else, counter += 1
    - Return nil if none are found
- occurence number method
  - 

=end

require 'date'

class Meetup
  attr_reader :year, :month
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_the_week, occurrence)
    day_num = find_day_num(day_of_the_week, occurrence)
    day_num.nil? ? nil : Date.civil(year, month, day_num)
  end

  def find_day_num(day_of_the_week, occurrence)
    counter = 1
    final_day = Date.civil(year, month, -1).day
    1.upto(final_day) do |day_num|
      if day_of_the_week.downcase == 'monday' && Date.civil(year, month, day_num).monday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'tuesday' && Date.civil(year, month, day_num).tuesday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num) 
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'wednesday' && Date.civil(year, month, day_num).wednesday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'thursday' && Date.civil(year, month, day_num).thursday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'friday' && Date.civil(year, month, day_num).friday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'saturday' && Date.civil(year, month, day_num).saturday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      elsif day_of_the_week.downcase == 'sunday' && Date.civil(year, month, day_num).sunday?
        return day_num if occurrence_number(occurrence) == counter 
        return day_num if occurrence_number(occurrence) == 0 && (13..19).to_a.include?(day_num)
        return day_num if (occurrence_number(occurrence) == -1 && day_num + 7 > final_day)
        counter += 1
      end
      # puts "Counter is #{counter}."
    end
    nil
  end

  def occurrence_number(occurrence)
    case occurrence.downcase
    when 'first' then 1
    when 'second' then 2
    when 'third' then 3
    when 'fourth' then 4
    when 'fifth' then 5
    when 'last' then -1
    when 'teenth' then 0
    end
  end
end

meetup = Meetup.new(2015, 10)
puts meetup.day('Monday', 'teenth')