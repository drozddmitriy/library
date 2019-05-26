require 'yaml'

module Module_DB

def load_entities
  if File.exist?("data.yml")
    data = YAML.load_file ("data.yml")
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
  else
    raise My_Valid.new("file not found!")
  end
end

def save
  data = {
      masauthor: @masauthor,
      masbook: @masbook,
      masorder: @masorder,
      masreader: @masreader
    }
    if File.exist?("data.yml")
      File.open("data.yml", "w") { |file| file.write(data.to_yaml) }
    else
      raise My_Valid.new("file not found!")
    end
end

end
