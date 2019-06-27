module Statistic
  def top_reader(orders, quantity)
    orders.group_by(&:reader).sort_by { |_key, order| -order.count }.first(quantity)
  end

  def most_popular_books(orders, quantity)
    orders.group_by(&:book).sort_by { |_key, order| -order.count }.first(quantity)
  end

  def num_of_readers_of_most_popular_books(orders, quantity)
    most_books = most_popular_books(orders, quantity)
    array_books = most_books.to_h.keys.map(&:title)
    orders.select { |order| array_books.include? order.book.title }
          .uniq { |value| value.reader.name }.count
  end
end
