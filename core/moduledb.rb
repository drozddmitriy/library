module Database
  FILE = 'data.yml'.freeze

  def load_entities
    raise Validation, 'file not found!' unless File.exist?(FILE)

    (YAML.load_file FILE) || { authors: nil, books: nil, orders: nil, readers: nil }
  end

  def save(data)
    raise Validation, 'file not found!' unless File.exist?(FILE)

    File.open(FILE, 'w') { |file| file.write(data.to_yaml) }
  end
end
