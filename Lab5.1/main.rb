regex = /\b(int|float|double|char)\b/

#regex_var2 = /#\b([a-z]+)\b/

cpp_code = [
  "#include <iostream>",
  "#include <string>",
  "",
  "double calculate_average(int values[], int count) {",
  "    double sum = 0.0;",
  "    for (int i = 0; i < count; ++i) {",
  "        sum += values[i];",
  "    }",
  "    return sum / count;",
  "}",
  "",
  "int main() {",
  "    int numbers[] = { 10, 20, 30, 45, 55 };",
  "    int total_elements = 5;",
  "    float point_scale = 1.25f;",
  "    char status = 'O';",
  "    char delimiter = ';';",
  "    bool is_international = false;",
  "    int print_counter = 0;",
  "",
  "    double result = calculate_average(numbers, total_elements);",
  "    std::cout << \"Result: \" << result * point_scale << std::endl;",
  "",
  "    return 0;",
  "}"
]

result = cpp_code.map do |line|
  line.gsub(regex, &:upcase)
end

#result_var2 = cpp_code.map do |line|
#  line.gsub(regex_var2) do
#    name = Regexp.last_match(1).upcase
#    "_#{name}"
#  end
#end

puts result.join("\n")
puts "-------------------------"
#puts result_var2.join("\n")