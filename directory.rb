def input_student
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
            puts 'Enter cohort:'
            cohort = gets.chomp.downcase.to_sym
        end

        @student << {name: name, cohort: cohort, lang: lang}
        puts "Now we have #{@student.count} student#{if @student.count != 1 then 's' end}."
    end
end
def print_header
    puts "The students of Villains Academy".center(80,'~')
    puts "--------------------------------".center(80,'/\\')
end
def print(student)
    if !student.empty?
        n = 1
        @cohorts.each do |coh|
            student.each do |s|
                if s[:cohort] == coh
                    puts "#{n}. #{s[:name].split.map(&:capitalize).join(' ')} (#{s[:cohort].capitalize} cohort), likes #{s[:lang]}".center(80, '*')
                    n += 1
                end
            end
        end
    end
end
def print_footer(list)
    puts "Overall, we have #{list.count} great students.".center(80,'=')
end
def show(s)
    print_header
    print s
    print_footer s
end
def puts_menu
    puts 'What would you like to do? (enter the option number)'
    puts '1. Enroll new student'
    puts '2. Load previous enrollments'
    puts '3. Show enrolled'
    puts '4. Save enrolled students'
    puts '0. Exit without saving'
end
def menu_select
    select = gets.chomp
    case select
        when "1" then input_student
        when "2" then load_students; show @student
        when "3" then show @student
        when "4" then save_students
        when "0" then exit
        else
            puts 'please enter the option number.'
            menu_select
    end
end
def menu
    @student = []
    loop do
        puts_menu
        menu_select
    end
end
def load_students
    dir = File.open('directory.csv','r')
    dir.readlines.each do |s|
        name, lang, cohort = s.chomp.split(',')
        @student << {name: name, lang: lang, cohort: cohort.to_sym}
    end
    dir.close
end
def save_students
    doc = File.open('directory.csv','a')
    @student.each do |s|
        doc.puts [s[:name], s[:lang], s[:cohort]].join(',') 
    end
    doc.close
end
menu