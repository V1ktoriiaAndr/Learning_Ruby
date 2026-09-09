print "Enter the number of regular clients (N): "
n = gets.to_i

clients = (1..n).to_a

print "Enter chronological alcoholic orders (space-separated): "
alco_orders = gets.chomp.split.map(&:to_i).select { |id| id <= n && id > 0 }

print "Enter chronological soft (non-alcoholic) orders (space-separated): "
soft_orders = gets.chomp.split.map(&:to_i).select { |id| id <= n && id > 0 }

all_orders = soft_orders + alco_orders
puts "1. Загальний список замовлень: #{all_orders.join(', ')}"
puts "   Загальна кількість замовлень = #{all_orders.size}"

today_visitors = all_orders.uniq.sort
puts "2. Список клієнтів за сьогодні: #{today_visitors.join(', ')}"
puts "   Кількість клієнтів за сьогодні = #{today_visitors.size}"

puts "3. Кількість безалкогольних замовлень = #{soft_orders.size}"

soft_visitors = soft_orders.uniq.sort
puts "4. Список безалкогольних клієнтів: #{soft_visitors.join(', ')}"
puts "   Кількість безалкогольних клієнтів = #{soft_visitors.size}"

puts "5. Кількість алкогольних замовлень = #{alco_orders.size}"

alco_visitors = alco_orders.uniq.sort
puts "6. Список алкогольних клієнтів: #{alco_visitors.join(', ')}"
puts "   Кількість алкогольних клієнтів = #{alco_visitors.size}"

both_types_visitors = soft_visitors & alco_visitors
puts "7. Список клієнтів (обидва типи): #{both_types_visitors.join(', ')}"
puts "   Кількість клієнтів (обидва типи) = #{both_types_visitors.size}"

absent_visitors = clients - today_visitors
puts "8. Список відсутніх постійних клієнтів: #{absent_visitors.join(', ')}"
puts "   Кількість відсутніх постійних клієнтів = #{absent_visitors.size}"
