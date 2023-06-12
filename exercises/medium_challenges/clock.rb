=begin
P:
- Create a clock
- Add/subtract minutes from time represented by a Clock object
  - Should not mutate object when adding/subtracting
    - Creates a new object
- Objects with the same time s/b equal to one another (== method)
- Need a to_s method for representation

Input: int
Output: num

E:
8 => '08:00'
9 => '09:00'
11, 3 => '11:03'

A:


=end
class Clock
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end

  def initialize(hours, minutes)
    @minutes = minutes
    @hours = hours
  end
  
  def hours
    hours_corrected = @hours % 24
    hours_corrected > 9 ? hours_corrected : "0#{hours_corrected}"
  end

  def minutes
    minutes_corrected = @minutes % 60
    minutes_corrected > 9 ? minutes_corrected : "0#{minutes_corrected}"
  end

  def to_s
    "#{hours}:#{minutes}"
  end

  def +(number)
    if @minutes + number > 60 && @hours < 23
      Clock.new(@hours + number / 60, @minutes + number - 60)
    elsif @minutes + number > 60 && @hours == 23
      Clock.new(0, @minutes + number - 60)
    else
      Clock.new(@hours, @minutes + number)
    end
  end

  def -(number)
    if @minutes - number < 0 && @hours == 0
      Clock.new(23, @minutes - number + 60)
    elsif @minutes - number < 0 && @hours > 0
      Clock.new(@hours - number / 60 - 1, @minutes - number + 60)
    else
      Clock.new(@hours, @minutes - number)
    end
  end

  def ==(other)
    self.to_s == other.to_s
  end
end

puts clock = Clock.at(10) - 90