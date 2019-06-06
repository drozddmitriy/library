class Book
  include ValidationEntity
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def validate
    instance?(String, title)
    instance?(Author, author)
    empty?(title)
  end
end
