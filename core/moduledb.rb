module Database
  def load_entities
    raise Myvalid, 'file not found!' unless File.exist?('data.yml')

    data = YAML.load_file 'data.yml'
    if data == false
      @masauthor = []
      @masbook = []
      @masorder = []
      @masreader = []
    else
      @masauthor = data[:masauthor]
      @masbook = data[:masbook]
      @masorder = data[:masorder]
      @masreader = data[:masreader]
    end
  end

  def save
    data = {
      masauthor: @masauthor,
      masbook: @masbook,
      masorder: @masorder,
      masreader: @masreader
    }
    raise Myvalid, 'file not found!' unless File.exist?('data.yml')

    File.open('data.yml', 'w') { |file| file.write(data.to_yaml) }
  end
end
