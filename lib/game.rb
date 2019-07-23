require_relative 'player'

class Game

    attr_accessor :HumanPlayer, :enemies

    def initialize(user_name)
      @human_player = HumanPlayer.new(user_name)
      @enemies = []
      player1 = Player.new("Alexia")
      player2 = Player.new("Bob")
      player3 = Player.new("Chloé")
      player4 = Player.new("Denis")
      @enemies << player1 << player2 << player3 << player4
    end

end
