require './dependency'

generator = Generator.new
library = Library.new

authors = generator.generate_authors
authors.each { |author| library.add_library_entity(author) }

books = generator.generate_books(authors)
books.each { |book| library.add_library_entity(book) }

readers = generator.generate_readers
readers.each { |reader| library.add_library_entity(reader) }

orders = generator.generate_orders(books, readers)
orders.each { |order| library.add_library_entity(order) }

library.add_library_entity(Reader.new('reader', 'reader@email', 'racooncity', 'some_street', 77))
library.add_library_entity(Author.new('lolo lala', 'biography'))
library.add_library_entity(Book.new('StarWars', library.authors.last))
library.add_library_entity(Order.new(library.books.last, library.readers.last, '2019-05-25'))

library.lib_save

puts 'Top reader: '
library.get_top_reader(3)
puts 'Most popular books: '
library.get_most_popular_books(2)
puts 'Number of Readers of the Most Popular Books: '
library.get_num_of_readers_of_most_popular_books(1)
