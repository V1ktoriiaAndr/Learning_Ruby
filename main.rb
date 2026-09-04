def calculate_price(count_pages, circulation)
    author_income = 24.0 * count_pages
    arrangment_cost = 0.30 * author_income
    typographic_set_cost = 1.2 * count_pages
    editorials_cost_total = author_income + arrangment_cost + typographic_set_cost
  
    editorial_cost_per_book = editorials_cost_total / circulation
  
    paper_cost_per_book = 0.16 * count_pages + 3.0
    paint_cost_per_book = 0.04 * count_pages
    amortization_per_book = 0.08 * count_pages
    typographic_cost_per_book = paper_cost_per_book + paint_cost_per_book + amortization_per_book
  
    cost_price_per_book = editorial_cost_per_book + typographic_cost_per_book
    cost_price_total = cost_price_per_book * circulation
  
    publishing_house_income_total = 0.23 * cost_price_total
    publishing_house_income_per_book = 0.23 * cost_price_per_book
  
    publishing_house_total_price_per_book = cost_price_per_book + publishing_house_income_per_book
    tax_per_book = 0.30 * publishing_house_total_price_per_book
  
    book_final_price = publishing_house_total_price_per_book + tax_per_book
  
    puts "Авторський гонорар: #{author_income} грн"
    puts "Собівартість книги (1 екз.): #{cost_price_per_book.round(2)} грн"
    puts "Прибуток видавництва від всього тиражу: #{publishing_house_income_total.round(2)} грн"
    puts "Податок на один екземпляр: #{tax_per_book.round(2)} грн"
    puts "Загальна вартість одного екземпляру: #{book_final_price.round(2)} грн"
  
    book_final_price
end
  
  print "Enter number of pages: "
  pages = gets.to_i
  
  print "Enter number of copies: "
  books = gets.to_i
  
  calculate_price(pages, books)
