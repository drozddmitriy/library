class Author
  include ValidationEntityModule
  attr_reader :name, :biography

  def initialize(name, biography = false)
    @name = name
    @biography = biography
  end

  def validate
    instance?(String, name)
    empty?(name)
  end
end
