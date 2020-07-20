require 'open-uri'
class GamesController < ApplicationController
  def new
    # letters = ("A".."Z").to_a
    @mix = %w[h o m e f] # letters.sample(8)
  end

  def score
    @respuesta = params[:respuesta]
    @mix = %w[h o m e f]
    # 3. hay que  validar que las letras usadas existan en el grid 
    @array_rta = @respuesta.split("") # [h,o,m,e]
    @array_rta.each do |letter|
      @included = @mix.include?(letter)
    end
    # 4. hay que validar que la palabra exista (API) -->
    # 5. NO EXISTE 
    url ="http://wagon-dictionary.herokuapp.com/#{@respuesta}"
    leer = open(url).read 
    @buscar = JSON.parse(leer)
    @estado = @buscar["found"]
  end
end
