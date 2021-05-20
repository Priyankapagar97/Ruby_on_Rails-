class Person
    attr_accessor :name, :age, :gender

def method_missing(a, *args, &b)
    a.match(/set_(.*)/) do |i|
        val = i.caotures[0]
        methods = self.method(val)
        methods.call(args[0])
end    

 a.match(/get_(.*)/) do |i|
    val = i.captures[0]
    methods = self.method(val)
    methods.call
    end
 end
end

p1 = Person.new
p1.name = 'chris'
p1.age = 35
p p1.name # chris
p p1.age #35
p1.set_name = 'Adam'
p1.set_age = 36
p p1.name # Adam
p p1.age # 36
