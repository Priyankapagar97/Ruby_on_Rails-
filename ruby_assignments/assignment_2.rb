class String
    def split(del=" ", &a)
        arr = []
        if del.length==0
            del=" "
        end
        str1 = " "
        i = 0
        self.each_char.with_index do |ele, j|
            if(ele == del)
                arr << self[i..j-1]
                yield self[i..j-1] if block_given?
                i++
            end
            if (j == self.length-1)
                arr << self[i..self.length-1]
                yield self[i..self.length-1] if block_given?
                break
            end
        end
        return arr
    end
end

str = "Medidata"
puts str.split

str = "M e d i d a t a"
puts str.split(" ")

str = "Medi*data"
puts str.split("*")

str = "M e d i d a t a"
puts str.split {|a| puts a.upcase}