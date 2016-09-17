student = [
    ["Dr. Hanibal Lecter", :november],
    ["Darth Vader", :november],
    ["Nurse Ratched", :november],
    ["Michael Corleone", :november],
    ["Alex DeLarge", :november],
    ["The Wicked Witch of the West", :november],
    ["Terminator", :november],
    ["Freddy Krueger", :november],
    ["The Joker", :november],
    ["Joffrey Baratheon", :november],
    ["Normal Bates", :november]
]

def print_header
    puts "The students of Villains Academy"
    puts "------------------"
end
def print(student)
        student.each{ |s| puts "#{s[0]} (#{s[1]} cohort)" }
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students."
end

print_header
print student
print_footer student