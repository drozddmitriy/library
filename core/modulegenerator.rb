module Generator
  def generation
    20.times { create_author(Faker::Name.name) }
    20.times { create_book(Faker::Book.title, @masauthor[Random.rand(1...20)]) }
    generation_reader_especially_for_rubocop
    20.times do
      create_order(@masbook[Random.rand(1...20)],
                   @masreader[Random.rand(1...20)])
    end
  end

  private

  def generation_reader_especially_for_rubocop
    20.times do
      create_reader(Faker::Name.name, Faker::Internet.email,
                    Faker::Address.city, Faker::Address.street_address,
                    Faker::Address.building_number.to_i)
    end
  end
end
