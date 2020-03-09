class GamesController < ApplicationController
  def new
    @grid = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(word, grid)
    word.chars.all? do |letter|
      word.count(letter) <= grid.count(letter)
    end
  end

  def score
    @word = params[:word].upcase
    @grid = params[:grid].split(' ')
    @score = @word.length
    @response = ''
    if included?(@word, @grid)
      if english_word?(@word.upcase)
        @response = 'Congratulations! Dune is a valid English word'
      else
        @response = "Sorry but #{@word} does not seem to be a valid English word..."
      end
    else
      @response = "Sorry but #{@word} can't be built out of #{@grid.join(', ')}."
    end
  end
end
