print "----------------------------------------------------------------\n"
print "Task 1: \n"
print "----------------------------------------------------------------\n"
class Mark
  attr_reader :subject, :value

  def initialize(subject, value)
    @subject = subject
    @value = value
  end

  def to_s
    "#{@subject} : #{@value}"
  end 
end

class Student
  attr_reader :marks, :name 

  def initialize(name, marks = [])
    @name = name  
    @marks = marks
  end

  def exists?(subject_title)
    @marks.any? { |mark| mark.subject == subject_title }
  end

  def add_mark(mark)
    unless exists?(mark.subject)
      @marks << mark
    end
  end

  def to_s
    "#{@name}: [#{@marks.map(&:to_s).join(', ')}]"
  end
end

mark = Mark.new('C++', 5)
puts "mark => #{mark}" 
st = Student.new('First student')
st.add_mark(mark)
puts "st => #{st}" 
mark2 = Mark.new('C++', 3)
st.add_mark(mark2)
puts "st => #{st}" 


print "----------------------------------------------------------------\n"
print "Task 2: \n"
print "----------------------------------------------------------------\n"
class RetakeStudent < Student
  def add_mark(mark)
    if exists?(mark.subject)
      @marks.reject! { |m| m.subject == mark.subject }
    end
    @marks << mark
  end
end

mark = Mark.new('C++', 5) 
puts "mark => #{mark}" 
mark2 = Mark.new('C++', 3)
ret = RetakeStudent.new('Other student') 
ret.add_mark(mark) 
ret.add_mark(mark2) 
puts "ret => #{ret}"


print "----------------------------------------------------------------\n"
print "Task 3: \n"
print "----------------------------------------------------------------\n"
class Pizza
  attr_reader :ingredients, :number, :d 
  
  @@count = 0
  @@failinstance = 0

  def initialize(diagonal, ingredients)
    if diagonal != 25 && diagonal != 50
      @ingredients = []
      @number = 0
      @d = 0
      @@failinstance += 1
    else
      @d = diagonal
      @ingredients = ingredients
      @@count += 1
      @number = @@count
    end
  end

  def self.failInstance
    @@failinstance
  end
end

pizza1 = Pizza.new(10, ['mushroom', 'cheese']) 
pizza2 = Pizza.new(25, ['mushroom', 'cheese', 'cherry']) 
pizza3 = Pizza.new(50, ['mushroom']) 
pizza4 = Pizza.new(100, ['mushroom', 'cheese', 'cherry']) 
puts "Pizza.failInstance => #{Pizza.failInstance}" # Виведе 2


print "----------------------------------------------------------------\n"
print "Task 4: \n"
print "----------------------------------------------------------------\n"
class Author
  attr_reader :name, :surname, :middle_name

  @@authors = []

  def self.all
    @@authors
  end

  def initialize(name, surname, middle_name = nil)
    validate_attribute!(name, "Name")
    validate_attribute!(surname, "Surname")
    validate_attribute!(middle_name, "Middle name") if middle_name

    if Author.exists?(name, surname, middle_name)
      raise ArgumentError, "Author #{name} #{surname} already exists in the list."
    end

    @name = name
    @surname = surname
    @middle_name = middle_name

    @@authors << self
  end

  private

  def self.exists?(name, surname, middle_name)
    @@authors.any? do |author|
      author.name == name && 
      author.surname == surname && 
      author.middle_name == middle_name
    end
  end

  def validate_attribute!(value, attr_name)
    unless value.to_s =~ /\A[\p{L}-]{1,15}\z/
      raise ArgumentError, "#{attr_name} must contain only letters/hyphens and be 1–15 characters long."
    end
  end
end

class Book
  attr_accessor :authors
  attr_reader :title, :year, :edition

  def initialize(authors, title, year, edition)
    unless valid_book?(authors, title, year, edition)
      @authors = nil
      @title = nil
      @year = nil
      @edition = nil
      return 
    end

    @authors = authors.uniq
    @title = title
    @year = year.to_i
    @edition = edition
  end

  private

  def valid_book?(authors, title, year, edition)
    current_year = Time.now.year 

    return false unless authors.is_a?(Array)
    return false if authors.empty?
    return false unless authors.all? { |a| a.is_a?(Author) }

    allowed_chars = /\A[\p{L}\d\s\-\.,;]+\z/
    return false unless title.to_s =~ allowed_chars
    return false unless edition.to_s =~ allowed_chars

    return false unless year.to_s =~ /\A\d{4}\z/
    return false if year.to_i > current_year

    true 
  end
end

author1 = Author.new("Тарас", "Шевченко", "Григорович")
author2 = Author.new("Іван", "Франко")
book1 = Book.new([author1, author2, author1], "Кобзар та Захар Беркут", 2023, "Дніпро")
puts "Book 1 authors count: #{book1.authors.count}" # Виведе 2 (унікальні)

book2 = Book.new([author1], "Кобзар #1!!!", 2024, "Дніпро")
puts "Book 2 title: #{book2.title.inspect}" # Виведе nil (невалідні символи)
print "----------------------------------------------------------------\n"
