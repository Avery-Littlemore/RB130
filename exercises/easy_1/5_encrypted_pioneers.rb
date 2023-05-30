INPUT = %w(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z)
OUTPUT = %w(N O P Q R S T U V W X Y Z A B C D E F G H I J K L M n o p q r s t u v w x y z a b c d e f g h i j k l m)

def decrypt(str)
  result = ''
  str.chars.each do |char|
    char_index = INPUT.index(char)
    decrypted_char = char_index.nil? ? ' ' : OUTPUT[char_index]
    result << decrypted_char
  end
  puts result
end

decrypt("Nqn Ybirynpr")
decrypt("Tenpr Ubccre")
decrypt('Nqryr Tbyqfgvar')
decrypt('Nyna Ghevat')
decrypt('Puneyrf Onoontr')
decrypt('Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv')
decrypt('Wbua Ngnanfbss')
decrypt('Ybvf Unvog')
decrypt('Pynhqr Funaaba')
decrypt('Fgrir Wbof')
decrypt('Ovyy Tngrf')
decrypt('Gvz Orearef-Yrr')
decrypt('Fgrir Jbmavnx')
decrypt('Xbaenq Mhfr')
decrypt('Fve Nagbal Ubner')
decrypt('Zneiva Zvafxl')
decrypt('Lhxvuveb Zngfhzbgb')
decrypt('Unllvz Fybavzfxv')
decrypt('Tregehqr Oynapu')