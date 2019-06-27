module DatabaseModule
  FILE_NAME = 'data.yml'.freeze

  def load_entities
    raise BookValidation, 'file not found!' unless File.exist?(FILE_NAME)

    (YAML.load_file FILE_NAME) || { authors: nil, books: nil, orders: nil, readers: nil }
  end

  def save(data)
    raise BookValidation, 'file not found!' unless File.exist?(FILE_NAME)

    File.open(FILE_NAME, 'w') { |file| file.write(data.to_yaml) }
  end
end
