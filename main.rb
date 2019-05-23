require_relative "core/Library"

lib = Library.new

# lib.create_Book("StarWars", lib.masauthor[1])

# lib.create_Reader("a", "@email", "racoon", "some_street", 77.123)

# lib.create_Author("la-la")

# lib.create_Order(lib.masbook[0], lib.masbook[1])

p lib.top_reader

p lib.most_popular_books(2)
# lib.show

pp lib.num_of_readers_of_most_popular_books
