print "Task 1: \n"

def task1(arr)
  result = Hash.new(0)

  arr.each do |item|
    key, value = item.split('-').map(&:strip)
    result[key.to_sym] += value.to_i
  end

  result
end

print "Дано: "
text = gets.chomp

result = task1(text.split(" "))
puts "Результат: #{result}"

print "--------------------------------------------------------------------------------\n"

print "Task 2: \n"

print "Дано: "
csv_text = gets.chomp

print "Max: "
max_value = gets.to_i

print "Upper bound: "
upper_bound_pct = gets.to_i
upper_limit = max_value - (max_value * upper_bound_pct / 100.0)

print "Lower bound: "
lower_bound_pct = gets.to_i
lower_limit = max_value * lower_bound_pct / 100.0


def task2(str, upper, lower)
  top_students = {}
  middle_students = {}
  bottom_students = {}

  str.split(/\\\s*/).each do |item|
    next if item.strip.empty?

    name, score_str = item.split(',')
    next if name.nil? || score_str.nil?

    name = name.strip
    score = score_str.to_i

    if score >= upper
      top_students[name] = score
    elsif score >= lower
      middle_students[name] = score
    else
      bottom_students[name] = score
    end
  end

  sort_proc = ->(student) { [-student[1], student[0]] }

  {
    top: top_students.sort_by(&sort_proc).map(&:first),
    middle: middle_students.sort_by(&sort_proc).map(&:first),
    bottom: bottom_students.sort_by(&sort_proc).map(&:first)
  }
end

final_result = task2(csv_text, upper_limit, lower_limit)
puts "Результат: #{final_result}"