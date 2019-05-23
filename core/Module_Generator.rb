require 'date'
require 'faker'
require_relative "../entities/Book"
require_relative "../entities/Author"
require_relative "../entities/Reader"
require_relative "../entities/Order"

module Module_Generator

def generate
      5.times{create_Author(Faker::Name.name)}
      5.times{create_Book(Faker::Book.title, @masauthor[Random.rand(1...5)])}
      5.times{create_Reader(Faker::Name.name,
                            Faker::Internet.email,
                            Faker::Address.city,
                            Faker::Address.street_address,
                            Faker::Address.building_number)}
      5.times{create_Order(@masbook[Random.rand(1...5)],
                          @masreader[Random.rand(1...5)])}
end

def create_Book(title, auth)
  if auth.is_a? Author
    book = Book.new(title, auth)
    @masbook.push(book)
  end
end

def create_Author(name, biography = false)
    auth = Author.new(name, biography)
    @masauthor.push(auth)
end

def create_Reader(name, email, city, street, house)
    reader = Reader.new(name, email, city, street, house)
    @masreader.push(reader)
end

def create_Order(book, reader, date = Date.today)
  if ((book.is_a? Book) && (reader.is_a? Reader))
    order = Order.new(book, reader, date)
    @masorder.push(order)
  end
end

end
