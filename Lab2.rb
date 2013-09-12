# Part1: Hello World
class HelloWorldClass
  def initialize(name)
    @name = name.capitalize
  end
  def sayHi
    puts "Hello #{@name}!"

  end
end
hello = HelloWorldClass.new("{Josh}")
hello.sayHi


# Part 2
def palindrome?(string)
  string = string.downcase
  string = string.gsub(/[,\-\'\!'@\#\$\%\^\&\*\(\)\_\+\=\:\"\<\>\?\ ]/, '')
  reverse = string.reverse
  if reverse == string
    return true
  else
    return false
  end
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")

def count_words(string)
  res = Hash.new(0)
  string.downcase.scan(/\w+/).map{|word| res[word] = string.downcase.scan(/\b#{word}\b/).size}
  return res
end

puts count_words("A man, a plan, a canal -- Panama")
puts count_words("Doo bee doo bee doo")

#part3
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless (game[0][1] == 'R' || game[0][1] == 'P' || game[0][1] == 'S')
  raise NoSuchStrategyError unless (game[1][1] == 'R' || game[1][1] == 'P' || game[1][1] == 'S')

  p1 = game[0][1]
    p2 = game[1][1]
    case p1
        when 'R'
          if p2 == 'S'
                   winner= game[0]
                else if p2 == 'R'
                          winner=     game[0]
                           else
                            winner= game[1]
                           end
                end
        when 'S'
          if p2 == 'S'
                  winner=  game[0]
                else if p2 == 'R'
                         winner=     game[1]
                           else
                            winner= game[0]
                           end
                end
         when 'P'
           if p2 == 'S'
                    winner= game[1]
                 else if p2 == 'R'
                           winner=     game[0]
                            else
                             winner= game[0]
                              end
                 end
         end

  puts winner
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a? String
    return rps_game_winner(tournament)
  else
    return rps_game_winner([rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
  end
end

rps_game_winner([ ["Armando", "P"], ["Dave", "S"] ] )
rps_tournament_winner([
                       [
                        [["Armando", "P"],["Dave", "S"]],
                        [["Richard","R"],["Michael","S"]],
                       ],
                       [
                        [["Allen","S"],["Omer","P"]],
                        [["David E.","R"],["Richard X.","P"]]
                       ]
                      ])

def combine_anagrams(words)
  array = []
  until words.empty?
    word = words.first
    array.push(words.select{|match| word.downcase.chars.sort.join.eql?(match.downcase.chars.sort.join)})
    words.delete_if {|match| word.downcase.chars.sort.join.eql?(match.downcase.chars.sort.join)}
    end
  array
end

puts combine_anagrams(['cars','for','potatoes','racs','four','scar','creams','scream'])
