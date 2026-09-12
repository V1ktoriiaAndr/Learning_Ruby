print "Введіть текст: "
text = gets.chomp

size = text.size
puts "Розмір тексту: #{size}"

upCaseLetters = text.count("A-Z")
puts "Кількість великих літер: #{upCaseLetters}"

downCaseLetters = text.count("a-z")
puts "Кількість малих літер: #{downCaseLetters}"

numbers = text.count("0-9")
puts "Кількість цифр: #{numbers}"

words = []
words = text.split(" ")
puts "Масив слів: #{words}"

sortedWords = words.sort
puts "Відсортований масив слів: #{sortedWords}"

capitalizedWords = words.map { |word| word.capitalize }
puts "Масив слів з великої літери: #{capitalizedWords}"

wordsWithNumbers = words.select { |word| word.match?(/\d/) }
puts "Масив слів з цифрами: #{wordsWithNumbers}"

backSortedWords = sortedWords.reverse
puts "Масив слів у зворотньому порядку: #{backSortedWords}"