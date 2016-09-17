def input_student
    student = []

    puts 'Enter name: '
    name = gets.chomp

    while !name.empty? do
        student << {name: name, cohort: :november}
        puts "Now we have #{student.count} students."
        name = gets.chomp
    end
    student
end
def print_header
    puts "The students of Villains Academy"
    puts "------------------"
end
def print(student)
puts "First letter of students' names:"
x = gets.chomp
n = 1
        student.each do |s| 
            if s[:name][0].downcase == x
                puts "#{n}. #{s[:name]} (#{s[:cohort]} cohort)"
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