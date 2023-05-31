# Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." 
# You should read the text from a simple text file that you provide. 
# (We also supply some example text below, but try the program with your text as well.)

class TextAnalyzer
  def process
    file = File.read('sample_text.txt')
    yield(file)
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(" ").size} words" }

# 3 paragraphs
# 15 lines
# 126 words