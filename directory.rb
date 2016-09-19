def input_student
    @student = []
    name = ' '

    while !name.empty? do
        puts 'Enter name:'                                                  
        name = gets.rstrip

        if name.empty? then break end

        puts 'Enter fav. programming language:'
        lang = gets.rstrip
        
        @cohorts = [:january, :february, :march, :may, :june, :july, :august, :september, :october, :november, :december]
        cohort = ''

        while !@cohorts.include?(cohort)
            puts 'Enter cohort'
            cohort = gets.rstrip.downcase.to_sym
        end

        @student << {name: name, cohort: cohort, lang: lang}
        puts "Now we have #{@student.count} student#{if @student.count != 1 then 's' end}."
    end
    @student
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
    puts '1. Enrollment new student 2. Show enrolled 0. Exit'
end
def menu
    @student = []
    loop do
        puts_menu
        select = gets.chomp
        case select
            when "1" then @student += input_student
            when "2" then show @student
            when "0" then exit
            else
                puts 'please enter the option number.'
        end
    end
end
menu