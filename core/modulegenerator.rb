module Generator
  def generation
    5.times { create_Author(Faker::Name.name) }
    5.times { create_Book(Faker::Book.title, @masauthor[Random.rand(1...5)]) }
    5.times do
      create_Reader(Faker::Name.name,
                    Faker::Internet.email,
                    Faker::Address.city,
                    Faker::Address.street_address,
                    Faker::Address.building_number)
    end
    5.times do
      create_Order(@masbook[Random.rand(1...5)],
                   @masreader[Random.rand(1...5)])
    end
  end
end
