print "Enter the number of regular clients (N): "
n = gets.to_i

clients = []
i = 1
while i <= n
  clients << i
  i += 1
end

def read_valid_orders(prompt, max_id)
  print prompt
  raw_items = gets.chomp.split
  valid_orders = []
  
  for item in raw_items
    id = item.to_i
    if id > 0 && id <= max_id
      valid_orders << id
    end
  end
  
  valid_orders
end

alco_orders = read_valid_orders("Enter chronological alcoholic orders (space-separated): ", n)
soft_orders = read_valid_orders("Enter chronological soft (non-alcoholic) orders (space-separated): ", n)

all_orders = []
for order in soft_orders
  all_orders << order
end
for order in alco_orders
  all_orders << order
end

puts "1. Загальний список замовлень: #{all_orders.join(', ')}"
puts "   Загальна кількість замовлень = #{all_orders.size}"

def custom_include?(arr, target)
  for item in arr
    return true if item == target
  end
  false
end

def get_unique_elements(arr)
  unique_arr = []
  for item in arr
    unless custom_include?(unique_arr, item)
      unique_arr << item
    end
  end
  unique_arr
end

def sort_array(arr)
  sorted = arr.dup
  length = sorted.size
  return sorted if length <= 1

  i = 0
  while i < length - 1
    j = 0
    while j < length - 1 - i
      if sorted[j] > sorted[j + 1]
        temp = sorted[j]
        sorted[j] = sorted[j + 1]
        sorted[j + 1] = temp
      end
      j += 1
    end
    i += 1
  end

  sorted
end

today_visitors = sort_array(get_unique_elements(all_orders))
puts "2. Список клієнтів за сьогодні: #{today_visitors.join(', ')}"
puts "   Кількість клієнтів за сьогодні = #{today_visitors.size}"

puts "3. Кількість безалкогольних замовлень = #{soft_orders.size}"

soft_visitors = sort_array(get_unique_elements(soft_orders))
puts "4. Список безалкогольних клієнтів: #{soft_visitors.join(', ')}"
puts "   Кількість безалкогольних клієнтів = #{soft_visitors.size}"

puts "5. Кількість алкогольних замовлень = #{alco_orders.size}"

alco_visitors = sort_array(get_unique_elements(alco_orders))
puts "6. Список алкогольних клієнтів: #{alco_visitors.join(', ')}"
puts "   Кількість алкогольних клієнтів = #{alco_visitors.size}"

both_types_visitors = []
for client in soft_visitors
  if custom_include?(alco_visitors, client)
    both_types_visitors << client
  end
end

puts "7. Список клієнтів (обидва типи): #{both_types_visitors.join(', ')}"
puts "   Кількість клієнтів (обидва типи) = #{both_types_visitors.size}"

absent_visitors = []
for client in clients
  unless custom_include?(today_visitors, client)
    absent_visitors << client
  end
end

puts "8. Список відсутніх постійних клієнтів: #{absent_visitors.join(', ')}"
puts "   Кількість відсутніх постійних клієнтів = #{absent_visitors.size}"