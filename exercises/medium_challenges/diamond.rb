=begin
P:
- Take a letter as input (string)
- Output a diamond consisting of all letters between A and input letter, where input letter is at the middle (widest point)

Rules
- The first row contains one 'A'.
- The last row contains one 'A'.
- All rows, except the first and last, have exactly two identical letters.
- The diamond is horizontally symmetric.
- The diamond is vertically symmetric.
- The diamond has a square shape (width equals height).
- The letters form a diamond shape.
- The top half has the letters in ascending order.
- The bottom half has the letters in descending order.
- The four corners (containing the spaces) are triangles.

Implicit:
- Assume upcase letters

E:
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A



  A  
 B B 
C   C
 B B
  A

 A
B B
 A

   A
  B B  
 C   C 
D     D
 C   C 
  B B
   A

Row 1
Total rows = 7
Current row = 1
Spaces = 3 0 3

Row 2
Total rows = 7
Current row = 2
Spaces = 2 1 2

Row 3
Total rows = 7
Current row = 3
Spaces = 1 3 1

Row 4
Total rows = 7
Current row = 4
Spaces = 0 5 0

Row 5
Total rows = 7
Current row = 5
Spaces = 1 3 1

Row 6
Total rows = 7
Current row = 6
Spaces = 2 1 2

Row 7
Total rows = 7
Current row = 5
Spaces = 3 0 3

  Other rows

Row 1
Total rows = 5
Current row = 1
Spaces = 2 0 2

Row 2
Total rows = 5
Current row = 2
Spaces = 1 1 1

Row 3
Total rows = 5
Current row = 3
Spaces = 0 3 0

Row 4
Total rows = 5
Current row = 4
Spaces = 1 1 1

Row 5
Total rows = 5
Current row = 5
Spaces = 2 0 2

# Row 1
# Total rows = 5
# Current row = 1
# Spaces = 2 0 2

# Row 2
# Total rows = 5
# Current row = 2
# Spaces = 1 1 1

# Row 3
# Total rows = 5
# Current row = 3
# Spaces = 0 3 0

# Row 4
# Total rows = 5
# Current row = 4
# Spaces = 1 1 1

# Row 5
# Total rows = 5
# Current row = 5
# Spaces = 2 0 2

Row 1
Total rows = 1
Current row = 1
Spaces = 1 0 1

Row 2
Total rows = 2
Current row = 2
Spaces = 0 1 0

Row 3
Total rows = 3
Current row = 3
Spaces = 1 0 1

A:

=end

class Diamond
  def self.make_diamond(letter)
    result = ''
    dia_length = letter.ord - 64
    total_lines = dia_length * 2 - 1
    1.upto(total_lines) do |current_line|
      result << build_line(current_line, total_lines)
    end
    result
  end

  def self.build_line(line_num, total_lines)
    middle_row = total_lines / 2 + 1
    char = line_num > middle_row ? (64 + total_lines - line_num + 1).chr : (64 + line_num).chr
    if line_num == 1 || line_num == total_lines
      ' ' * (total_lines / 2) + char + ' ' * (total_lines / 2) + "\n"
    else
      total_blanks = total_lines - 2
      outside_blanks = line_num > middle_row ? line_num - middle_row : middle_row - line_num
      middle_blanks = total_blanks - outside_blanks * 2
      ' ' * outside_blanks + char + ' ' * middle_blanks + char + ' ' * outside_blanks + "\n"
    end
  end
end

# puts Diamond.make_diamond('A')
# puts Diamond.make_diamond('B')
# puts Diamond.make_diamond('C')
# puts Diamond.make_diamond('D')


