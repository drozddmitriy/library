class Generator
  def generate_authors
    authors = []
    10.times { authors.push(Author.new(FFaker::Name.name)) }
    authors
  end

  def generate_books(authors)
    books = []
    10.times { books.push(Book.new(FFaker::Book.title, authors.sample)) }
    books
  end

  def generate_orders(books, readers)
    orders = []
    10.times { orders.push(Order.new(books.sample, readers.sample)) }
    orders
  end

  def generate_readers
    readers = []
    10.times do
      readers.push(Reader.new(FFaker::Name.name, FFaker::Internet.email,
                              FFaker::Address.city,
                              FFaker::Address.street_name,
                              FFaker::Address.building_number.to_i))
    end
    readers
  end
end
