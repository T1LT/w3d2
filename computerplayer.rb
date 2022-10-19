class ComputerPlayer
    attr_writer :memory
    def initialize()
        @input = []
        #@memory = Hash.new { |h, k| h[k] = [] }
    end

    def get_input(hash)
        two = hash.select { |k, v| v.length == 2 }
        one = hash.select { |k, v| v.length == 1 }
        if two.size >= 1
            return two.values[0]
        elsif one.size >= 1
            return [*one.values[0], random(one.values[0], hash)[1]]
        else
            return [random(hash)[0], random(hash)[1]]
        end
    end

    def random(arr = [[(0..3).to_a.sample, (0..3).to_a.sample]], hash)
        # arr = [[(0..3).to_a.sample, (0..3).to_a.sample]]

        arr2 = []
        until arr.length == 2 && !hash.values.flatten.include?(arr)
            i = (0..3).to_a.sample
            j = (0..3).to_a.sample
            if arr[0] != [i, j]
                arr << [i, j]
            end
        end
        arr
    end
end