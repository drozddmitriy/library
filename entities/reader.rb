class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house.to_i
  end

  def validate
    instance?(String, name, email, city, street)
    empty?(name, email, city, street)
    raise Validation, 'error house' unless house.is_a? Integer
  end
end
