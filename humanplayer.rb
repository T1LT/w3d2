class HumanPlayer

    def initialize
        @input = []
    end

    def get_input(hash)
        print "Enter guess position: "
        @input = gets.chomp
        @input = @input.split(" ").map(&:to_i)
        @input
    end
end