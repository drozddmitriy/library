class Library
  include Database
  include Statistic

  attr_accessor :authors, :books, :orders, :readers

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
    else raise BookValidation, 'entity is faile!'
    end
  end

  def get_top_reader(quantity = 1)
    list = top_reader(@orders, quantity)
    list.to_h.each_key do |reader|
      puts reader.name
    end
  end

  def get_most_popular_books(quantity = 1)
    list = most_popular_books(@orders, quantity)
    list.to_h.each_key do |book|
      puts book.title
    end
  end

  def get_num_of_readers_of_most_popular_books(quantity = 3)
    puts num_of_readers_of_most_popular_books(@orders, quantity)
  end
end
