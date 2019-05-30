require './dependency'

class Library
  include Database
  include Generator

  attr_accessor :masauthor, :masbook, :masorder, :masreader

  def initialize
    load_entities
  end

  def create_book(title, auth)
    raise Myvalid, 'wrong argument author!' unless auth.is_a? Author

    @masbook.push(Book.new(title, auth))
  end

  def create_author(name, biography = false)
    @masauthor.push(Author.new(name, biography))
  end

  def create_reader(name, email, city, street, house)
    raise Myvalid, 'house should be a Integer and positive number!' unless (house.is_a? Integer) && house.positive?

    @masreader.push(Reader.new(name, email, city, street, house))
  end

  def create_order(book, reader, date = Date.today)
    raise Myvalid, 'wrong argument book or reader!' unless (book.is_a? Book) && (reader.is_a? Reader)

    @masorder.push(Order.new(book, reader, date))
  end

  def top_reader(quantity = 1)
    mass = []
    hash = @masorder.each_with_object(Hash.new(0)) { |v, h| h[v.reader.name] += 1; }

    raise Myvalid, 'quantity is faile!' unless hash.count >= quantity

    quantity.times do
      a = hash.max_by { |_k, v| v }[0]
      mass.push(a)
      hash.delete_if { |k, _v| k == a }
    end
    mass
  end

  def most_popular_books(quantity = 1)
    mass = []
    hash = @masorder.each_with_object(Hash.new(0)) { |v, h| h[v.book.title] += 1; }

    raise Myvalid, 'quantity is faile!' unless hash.count >= quantity

    quantity.times do
      a = hash.max_by { |_k, v| v }[0]
      mass.push(a)
      hash.delete_if { |k, _v| k == a } # ###.first
    end
    mass
  end

  def num_of_readers_of_most_popular_books(quantity = 3)
    most_books = most_popular_books(quantity)

    @masorder.select { |order| most_books.include? order.book.title }
             .uniq { |value| value.reader.name }.count
  end
end
