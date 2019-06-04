require './dependency'

begin
  lib = Library.new

  # generate Library
  # lib.generation

  # # ##################create entities################################
  # lib.add_library_entity(Reader.new('reader', 'reader@email', 'racooncity', 'some_street', 77))
  # lib.add_library_entity(Author.new('lolo lala', 'biography'))
  # lib.add_library_entity(Book.new('StarWars', lib.authors.last))
  # lib.add_library_entity(Order.new(lib.books.last, lib.readers.last, '2019-05-25'))
  ##################################################################
  #
  # # save Library
  # lib.save(lib.to_hash)
  #
  # ###############statistic#########################################
  puts 'Top reader: '
  puts lib.top_reader(3)
  puts 'Most popular books: '
  puts lib.most_popular_books(2)
  puts 'Number of Readers of the Most Popular Books: '
  puts lib.num_of_readers_of_most_popular_books(1)
  ##################################################################
rescue Validation => e
  puts e.message
end
