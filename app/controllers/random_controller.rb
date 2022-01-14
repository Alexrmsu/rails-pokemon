class RandomController < ApplicationController
  def index
    url = "https://pokeapi.co/api/v2/pokemon/"
    response = HTTParty.get url
    result = JSON.parse response.to_s
    @name= result['results'][rand(1..20)]['name']
    puts " nombre es : #{@name}"
  end
end
