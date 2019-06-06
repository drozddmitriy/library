class Library
  include Database

  attr_accessor :authors, :books, :orders, :readers, :hash

  def initialize
    data = load_entities
    @authors = data[:authors] || []
    @books = data[:books] || []
    @orders = data[:orders] || []
    @readers = data[:readers] || []
  end

  def lib_save
    save(authors: @authors, books: @books, orders: @orders, readers: @readers)
  end

  def add_library_entity(entity)
    entity.validate
    case entity
    when Book then @books.push(entity)
    when Author then @authors.push(entity)
    when Reader then @readers.push(entity)
    when Order then @orders.push(entity)
    else raise Validation, 'entity is faile!'
    end
  end

  def top_reader(quantity = 1)
    hash = @orders.each_with_object(Hash.new(0)) { |v, h| h[v.reader.name] += 1; }

    raise Validation, 'quantity is faile!' unless hash.count >= quantity

    hash.keys.reverse_each.first(quantity)
  end

  def most_popular_books(quantity = 1)
    hash = @orders.each_with_object(Hash.new(0)) { |v, h| h[v.book.title] += 1; }

    raise Validation, 'quantity is faile!' unless hash.count >= quantity

    hash.keys.reverse_each.first(quantity)
  end

  def num_of_readers_of_most_popular_books(quantity = 3)
    most_books = most_popular_books(quantity)

    @orders.select { |order| most_books.include? order.book.title }
           .uniq { |value| value.reader.name }.count
  end
end
