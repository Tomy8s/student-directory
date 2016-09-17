student = [
    {:name=>"Dr. Hanibal Lecter", :cohort=>:november},
    {:name=>"Darth Vader", :cohort=>:november},
    {:name=>"Nurse Ratched", :cohort=>:november},
    {:name=>"Michael Corleone", :cohort=>:november},
    {:name=>"Alex DeLarge", :cohort=>:november},
    {:name=>"The Wicked Witch of the West", :cohort=>:november},
    {:name=>"Terminator", :cohort=>:november},
    {:name=>"Freddy Krueger", :cohort=>:november},
    {:name=>"The Joker", :cohort=>:november},
    {:name=>"Joffrey Baratheon", :cohort=>:november},
    {:name=>"Normal Bates", :cohort=>:november}
]

def print_header
    puts "The students of Villains Academy"
    puts "------------------"
end
def print(student)
        student.each{ |s| puts "#{s[:name]} (#{s[:cohort]} cohort)" }
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students."
end

print_header
print student
print_footer student