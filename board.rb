require_relative 'card.rb'
class Board
    attr_reader :grid
    def initialize()
        @size = 4
        @deck = ("A".."H").to_a
        @grid = Array.new(@size) {Array.new(@size)}
    end

    def render
        (0...@size).each do |i|
            (0...@size).each do |j|
                print @grid[i][j].faceup ? @grid[i][j].value : ' '
                print ' '
            end
            puts ''
        end
        puts "-------------"
    end

    def populate
        shuffled_cards = (@deck + @deck).shuffle
        d = 0
        @size.times do |i|
            @size.times do |j|
                @grid[i][j] = Card.new(shuffled_cards[d])
                d += 1
            end
        end
    end

    def won?
        @size.times do |i|
            @size.times do |j|
                return false if @grid[i][j].faceup == false
            end
        end
        true
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def reveal(guessed_pos)
        self[guessed_pos].faceup = true if self[guessed_pos].faceup == false
        self[guessed_pos]
    end
end



# b = Board.new()
# b.populate
# b.render
# p b.won?