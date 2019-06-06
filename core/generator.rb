class Generator
  def generate_authors
    authors = []
    20.times { authors.push(Author.new(Faker::Name.name)) }
    authors
  end

  def generate_books
    books = []
    20.times { books.push(Book.new(Faker::Book.title, generate_authors.sample)) }
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
      readers.push(Reader.new(Faker::Name.name, Faker::Internet.email,
                              Faker::Address.city,
                              Faker::Address.street_name,
                              Faker::Address.building_number.to_i))
    end
    readers
  end
end
