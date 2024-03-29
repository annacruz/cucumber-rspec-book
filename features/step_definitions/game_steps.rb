# encoding: UTF-8

Quando(/^começo um novo jogo$/) do
  start_new_game
end

Então(/^vejo na tela:$/) do |text|
  steps %{
    * the stdout should contain "#{text}"
  }
end

Dado(/^que comecei um jogo$/) do
  start_new_game
end

Quando(/^escolho que a palavra a ser sorteada deverá ter "(.*?)" letras$/) do |number_of_letters|
  steps %{
    * I type "#{number_of_letters}"
  }
end

Então(/^o jogo termina com a seguinte mensagem na tela:$/) do |text|
  steps %{
    * it should pass with:
     """
     #{text}
    """
  }
end

Quando(/^termino o jogo$/) do
  steps %{
    * I type "fim"
  }
end

Dado(/^o jogo tem as possiveis palavras para sortear:$/) do |words_table|
  words = words_table.rows.map(&:last).join(" ")
  set_rafflable_words(words)
end

Dado(/^que escolhi que a palavra a ser sorteada deverá ter "(.*?)" letras$/) do |number_of_letters|
  steps %{
    * I type "#{number_of_letters}"
  }
end

Quando(/^tento adivinhar que a palavra tem a letra "(.*?)"$/) do |letter|
  steps %{
    * I type "#{letter}"
  }
end

Então(/^o jogo mostra que eu adivinhei uma letra com sucesso$/) do
  steps %{
    * the stdout should contain:
      """
      Você adivinhou uma letra com sucesso.
      """
  }
end

Então(/^o jogo mostra que eu errei a adivinhação da letra$/) do
  steps %{
    * the stdout should contain:
      """
      Você errou a letra.
      """
  }
end

Quando(/^tento adivinhar que a palavra tem a letra "(.*?)" "(.*?)" vezes$/) do |letter, number_of_guesses|
  number_of_guesses.to_i.times do
    steps %{
      * tento adivinhar que a palavra tem a letra "#{letter}"
    }
  end
end

