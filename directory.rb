student = [
 "Dr. Hanibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
 "The Wicked Witch of the West",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Normal Bates"
 ]

def print_header
    puts "The students of Villains Academy"
    puts "------------------"
end
def print(student)
        student.each{ |s| puts s}
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students."
end

print_header
print student
print_footer student