class Generator
  def generate_authors
    authors = []
    20.times { authors.push(Author.new(FFaker::Name.name)) }
    authors
  end

  def generate_books
    books = []
    20.times { books.push(Book.new(FFaker::Book.title, generate_authors.sample)) }
    books
  end

  def generate_orders
    orders = []
    20.times { orders.push(Order.new(generate_books.sample, generate_readers.sample)) }
    orders
  end

  def generate_readers
    readers = []
    20.times do
      readers.push(Reader.new(FFaker::Name.name, FFaker::Internet.email,
                              FFaker::Address.city,
                              FFaker::Address.street_name,
                              FFaker::Address.building_number.to_i))
    end
    readers
  end
end
