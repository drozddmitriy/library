require_relative "Module_DB"
require_relative "Module_Generator"
require_relative "My_Valid"
#faker

class Library
  include Module_DB
  include Module_Generator

  attr_accessor :masauthor, :masbook, :masorder, :masreader
def initialize
    #load array entities
    load_entities
end

def top_reader(quantity = 1)

    mass = []
    hash = @masorder.inject(Hash.new(0)) { |h,v| h[v.reader.name] += 1; h }

    if(hash.count >= quantity)
        quantity.times do
          a = hash.max_by{|k,v| v}[0]
          mass.push(a)
          hash.delete_if{ |k,v| k == a }
        end
        mass
    else
      raise My_Valid.new("quantity is faile!")
    end
end

def most_popular_books(quantity = 1)

    mass = []
    hash = @masorder.inject(Hash.new(0)) { |h,v| h[v.book.title] += 1; h }

    if (hash.count >= quantity)
      quantity.times do
        a = hash.max_by{|k,v| v}[0]
        mass.push(a)
        hash.delete_if{ |k,v| k == a }
      end
      mass
    else
      raise My_Valid.new("quantity is faile!")
    end
end

def num_of_readers_of_most_popular_books(quantity = 3)
    most_books = most_popular_books(quantity)

    var = @masorder.select { |order| most_books.include? order.book.title }
    .uniq{ |value| value.reader.name }.count
end

# def show
#   pp @masorder
# end

end
