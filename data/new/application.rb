require "fairytale"

get "/" do
  erb :index, content: md(:index)
end
