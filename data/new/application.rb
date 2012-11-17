require "fairytale"

get "/" do
  @content = md :index
  erb :index
end
