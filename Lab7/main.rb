print "Task 1: \n"
puts "Arguments: 4, 0, -12"

def sum(arg1 = 4, arg2 = 0, arg3 = -12)
  args = [arg1, arg2, arg3]
  res = 0
  res = args.map { |x| x >= 0 ? yield(x) : x * x }
  res.sum
end

puts "Result: #{sum {|x| x}}"


print "--------------------------------------------------------------------------------\n"
print "Task 2: \n"
def check_password(u1, p1)
    Proc.new do |input_user, input_password|
    input_user == u1 && input_password == p1
  end
end

name = "admin"
password = "12345"
admin = check_password(name, password)
puts "Arguments: #{name}, #{password}"
puts "admin.call(u1, p1) => #{admin.call(name, password)}"
puts "admin.call(u) => #{admin.call("u")}"