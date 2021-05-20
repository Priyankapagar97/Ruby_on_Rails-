class EmptyArray < StandardError
    def initialize(input)
        super("Please provide array !!!")
    end
end

class NotAnArray < StandardError
    def initialize(input)
        super("Array should not be empty!")
    end
end

class EvenNumberMissing < standardError
    def initialize(input)
        super("Missing even number in array")
    end
end

def even_number(arr)
    if !arr .is_a? (Array)
        raise NotAnArray
    elsif arr.empty?
        raise EmptyArray
    elsif arr.find_all {|no| no.even?}.empty?
        raise EvenNumberMissing
    end
end


