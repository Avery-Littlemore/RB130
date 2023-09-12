=begin
P:
- Generate 99 bottles of beer song
- 

input: int
output: string

E:


A:
- Create class BeerSong
- Create class method ::lyrics
  - produce all lyrics
- Create class method ::verses with two parameters (starting number, ending number)
  - Reveal the lyrics starting from the start_int until the end_int 
- create class method ::verse with one parameters (int)
  - Reveal the lryics from that one verse

=end

class BeerSong
  def self.lyrics
    lyrics = ''
    99.downto(0) do |current|
      lyrics << lyric(current)
      lyrics << "\n" if current > 0
      current -= 1
    end
    lyrics
  end

  def self.verse(verse_num)
    lyric(verse_num)
  end

  def self.verses(start_verse_num, end_verse_num)
    lyrics = ''
    start_verse_num.downto(end_verse_num) do |current|
      lyrics << lyric(current)
      lyrics << "\n" if current > end_verse_num
      current -= 1
    end
    lyrics
  end

  class << self
    private

    def lyric(num)
      if num > 2
        "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
      elsif num == 2
        "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
      elsif num == 1
        "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      else
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
  end
end

# puts BeerSong.lyrics
# puts BeerSong.verse(99)
# puts BeerSong.verses(10,7)

def lyrics(num)
  if num > 2
  # ...        
  elsif num == 2
  # ...
  elsif num == 1
  # ...
  else
  # ...
  end
end