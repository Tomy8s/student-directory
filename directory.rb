def input_student
    student = []
    name = ' '

    while !name.empty? do
        puts 'Enter name:'                                                  
        name = gets.chomp

        if name.empty? then break end

        puts 'Enter fav. programming language:'
        lang = gets.chomp

        student << {name: name, cohort: :november, lang: lang}
        puts "Now we have #{student.count} students."
    end
    student
end
def print_header
    puts "The students of Villains Academy"
    puts "------------------"
end
def print(s)
n = 1
         while n <= s.length 
            if s.length < 12
                puts "#{n}. #{s[n - 1][:name]} (#{s[n - 1][:cohort]} cohort),  likes  #{s[n - 1][:lang]}"
                n += 1
            end
        end
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students."
end

student = input_student
print_header
print student
print_footer student