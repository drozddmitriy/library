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
  end
end

def save
  data = {
      masauthor: @masauthor,
      masbook: @masbook,
      masorder: @masorder,
      masreader: @masreader
    }
  File.open("data.yml", "w") { |file| file.write(data.to_yaml) }
end

end
