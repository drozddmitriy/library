class Order
  include ValidationEntity
  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    @book = book
    @reader = reader
    @date = date
  end

  def validate
    instance?(Book, book)
    instance?(Reader, reader)
  end
end
