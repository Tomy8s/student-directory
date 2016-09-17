def input_student
    student = []
    name = ' '

    while !name.empty? do
        puts 'Enter name:'                                                  
        name = gets.chomp

        if name.empty? then break end

        puts 'Enter fav. programming language:'
        lang = gets.chomp
        
        @cohorts = [:january, :february, :march, :may, :june, :july, :august, :september, :october, :november, :december]
        cohort = ''

        while !@cohorts.include?(cohort)
            puts 'Enter cohort'
            cohort = gets.chomp.downcase.to_sym
        end

        student << {name: name, cohort: cohort, lang: lang}
        puts "Now we have #{student.count} student#{if student.count != 1 then 's' end}."
    end
    student
end
def print_header
    puts "The students of Villains Academy".center(80,'~')
    puts "--------------------------------".center(80,'/\\')
end
def print(s)
n = 1
    @cohorts.each do |coh|
        s.each do |s|
            if s[:cohort] == coh
                puts "#{n}. #{s[:name].capitalize} (#{s[:cohort].capitalize} cohort),  likes  #{s[:lang]}".center(80, '*')
                n += 1
            end
        end
    end
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students.".center(80,'=')
end

student = input_student
print_header
print student
print_footer student