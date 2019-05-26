require_relative "core/Library"
begin

lib = Library.new

#generate Library
# lib.generate

###################create entities################################
# lib.create_Reader("reader", "reader@email", "racooncity", "some_street", 77)
# lib.create_Author("George Raymond Richard Martin", "biography")
# lib.create_Book("StarWars", lib.masauthor.last)
# lib.create_Order(lib.masbook.last, lib.masreader.last, "2019-05-25")
##################################################################

#save Library
# lib.save

################statistic#########################################
puts "Top reader: "
puts lib.top_reader(3)
puts "Most popular books: "
puts lib.most_popular_books(2)
puts "Number of Readers of the Most Popular Books: "
puts lib.num_of_readers_of_most_popular_books(1)
##################################################################
rescue My_Valid => error
  puts error.message
end
