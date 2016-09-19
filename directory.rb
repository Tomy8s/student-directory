$cohorts = [:january, :february, :march, :may, :june, :july, :august, :september, :october, :november, :december]
@student = []


def input_student
    name = ' '

    while !name.empty? do
        puts 'Enter name:'                                                  
        name = gets.chomp

        if name.empty? then break end

        puts 'Enter fav. programming language:'
        lang = gets.chomp
        
        cohort = ''

        while !$cohorts.include?(cohort)
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


def print_student
    if !@student.empty?
        n = 1
        $cohorts.each do |coh|
            @student.each do |s|
                if s[:cohort] == coh
                    puts "#{n}. #{s[:name].split.map(&:capitalize).join(' ')} (#{s[:cohort].capitalize} cohort), likes #{s[:lang]}".center(80, '*')
                    n += 1
                end
            end
        end
    end
end


def print_footer
    puts "Overall, we have #{@student.count} great student#{if @student.count != 1 then 's' end}.".center(80,'=')
end


def show
    print_header
    print_student
    print_footer
end


def puts_menu
    puts
    puts 'What would you like to do? (enter the option number)'
    puts '1. Enroll new student'
    puts '2. Load previous enrollments'
    puts '3. Show enrolled'
    puts '4. Save enrolled students'
    puts '0. Exit without saving'
end


def menu_select(select)
    case select
    when "1"
        puts "\nEnroll new students"
        puts '-------------------'
        input_student
    when "2"
        puts "\nLoading student lists"
        puts '---------------------'
        load_students; show
    when "3" then
        puts "\nShowing student lists"
        puts '---------------------'
        show
    when "4"
        puts "\nSaving student lists"
        puts '---------------------'
        save_students
    when "0" then exit
    else
        puts 'please enter the option number.'
    end
end


def menu
    loop do
        puts_menu
        menu_select(gets.chomp)
    end
end


def load_on_run
    filename = ARGV.first
    if !filename.nil?
        load_students(filename)
    else
        load_err
    end
end


def load_err
    puts 'No file found. Load from default? (Y/N)'
    ans = gets.chomp
    case ans[0].downcase
    when 'y' then load_students
    when 'n' then menu
    else load_err
    end
end


def load_students(filename = 'directory.csv')
    dir = File.open(filename,'r')
    dir.readlines.each do |s|
        name, lang, cohort = s.chomp.split(',')
        @student << {name: name, lang: lang, cohort: cohort.to_sym}
    end
    puts "#{@student.length} students loaded from #{filename}"
    dir.close
end


def save_students
    doc = File.open('directory.csv','w')
    @student.each do |s|
        doc.puts [s[:name], s[:lang], s[:cohort]].join(',') 
    end
    doc.close
    puts "#{@student.length} student#{if @student.count != 1 then 's' end} saved to 'directory.csv'"
end


load_on_run
menu