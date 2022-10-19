class Card
    attr_reader :value
    attr_accessor :faceup
    
    def initialize(value)
        @value = value
        @faceup = false
    end

    def reveal
        @faceup = true
        #@value if @card[value] == true
    end

    def hide
        @faceup = false
        #@value[1] if @faceup == false
    end

    def to_s
        @value.to_s
    end

    # def ==(card)
    #     @value == card.value
    # end
end

# c1 = Card.new(5)
# p c1.reveal
# p c1.hide
# p c1.to_s
# c2 = Card.new(5)
# p c1 == c2