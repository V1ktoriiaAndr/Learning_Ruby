print("Введіть площу квартири(кв.м): ")
area = gets.to_f

print("Виберіть матеріал: \n1. Бетон\n2. Цегла\n3. Композит\n")
material = gets.chomp.downcase

print("Виберіть поверх(1-9): ")
floor = gets.to_i  

print("Виберіть район: \n1. Центр\n2. Спальний\n3. Приміський\n")
district = gets.chomp.downcase

print("Виберіть архітектурний стиль: \n1. Хайтех\n2. Ексклюзів\n3. Індивідуал\n4. Стандарт\n")
style = gets.chomp.downcase

print("Виберіть індекс категорії: \n1. Елітна\n2. Бюджетна\n3. Пільгова\n")
category = gets.chomp.downcase

material_index = case material
                 when "1", "бетон"
                   300.0
                 when "2", "цегла"
                   500.0
                 when "3", "композит"
                   800.0
                else
                   puts "Невірний вибір матеріалу."
                   exit
                 end

floor_index = (3..7).cover?(floor) ? 1.4 : 1.1

if district == "1" || district == "центр"
  district_index = 1.7
elsif district == "2" || district == "спальний"
  district_index = 1.4
elsif district == "3" || district == "приміський"
  district_index = 1.15
else
  puts "Невірний вибір району."
  exit
end

style_index = case style
              when "1", "хайтех"
                2.0   
              when "2", "ексклюзів"
                1.7
              when "3", "індивідуал"
                1.5
              when "4", "стандарт"
                1.05
              else
                puts "Невірний вибір стилю."
                exit
              end

category_index = if category == "1" || category == "еліта"
                   1.75
                 elsif category == "2" || category == "бюджетна"
                   1.5
                 elsif category == "3" || category == "пільгова"
                   1.07
                 else
                   puts "Невірний вибір категорії."
                   exit
                 end


def calculate_price(area, material_index, floor_index, district_index, style_index, category_index)
  base_price = area * material_index
  placement = base_price * floor_index * district_index
  builders_price = placement * style_index
  price_with_tax = builders_price * category_index
  
  puts "Собівартість будівництва: #{base_price.round(2)} грн"
  puts "Вартість забудовника: #{builders_price.round(2)} грн"
  puts "Загальна вартість: #{price_with_tax.round(2)} грн"
  return price_with_tax
end

total_price = calculate_price(area, material_index, floor_index, district_index, style_index, category_index)