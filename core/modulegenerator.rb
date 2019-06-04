module Generator
  def generation
    20.times { add_library_entity(Author.new(Faker::Name.name)) }
    20.times { add_library_entity(Book.new(Faker::Book.title, @authors[Random.rand(1...20)])) }
    generation_reader_especially_for_rubocop
    20.times do
      add_library_entity Order.new(@books[Random.rand(1...20)],
                                   @readers[Random.rand(1...20)])
    end
  end

  private

  def generation_reader_especially_for_rubocop
    20.times do
      add_library_entity Reader.new(Faker::Name.name, Faker::Internet.email,
                                    Faker::Address.city, Faker::Address.street_address,
                                    Faker::Address.building_number.to_i)
    end
  end
end
