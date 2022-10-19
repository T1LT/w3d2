require_relative "board.rb"
require_relative "humanplayer.rb"
require_relative "computerplayer.rb"

class Game
    def initialize()
        @board = Board.new()
        @guessed_pos = []
        @human = HumanPlayer.new
        @computer = ComputerPlayer.new
        @current_player = @human
        @guesses = Hash.new {|h,k| h[k] = []}
    end

    def switch_turn
        @current_player = @current_player == @human ? @computer : @human
    end

    def make_guess
        guess = @current_player.get_input(@guesses)
        guess_card = @board.reveal(guess)
        @guesses[guess_card.value] << guess
        guess_card
    end

    def computer_guess
        guess1, guess2 = @current_player.get_input(@guesses)
        puts "guess1: #{guess1}; guess2: #{guess2}"
        guess_card1 = @board.reveal(guess1)
        guess_card2 = @board.reveal(guess2)
        @guesses[guess_card1.value] << guess1
        @guesses[guess_card2.value] << guess2
        [ guess_card1, guess_card2 ]
    end

    def play
        @board.populate
        until @board.won?
            # system("clear")
            @board.render
            if @current_player == @human
                prev = make_guess
                @board.render
                current = make_guess
                @board.render
            else
                prev, current = computer_guess
                @board.render
            end
            if !(prev.value == current.value)
                prev.hide
                current.hide
            else
                @guesses.delete_if { |k, v| k == current.value }
            end
            sleep(5)
            switch_turn
        end
        puts "YOU WON!"
    end
end

g = Game.new()
g.play