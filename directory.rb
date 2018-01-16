require "csv"

@students = []
@line_width = 50
@cohort = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, ""]

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts " "
  puts "Please select an option:"
  puts " "
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      select_where_to_load_from
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy".center(@line_width)
  puts "--------------".center(@line_width)
end

def input_students
puts "Please enter the names of the students"
puts "To finish, just hit return twice"
@students = []
name = STDIN.gets.strip.capitalize
while !name.empty? do
puts "Please enter #{name}'s cohort"
cohort = STDIN.gets.strip.capitalize.to_sym
  while true do
    if cohort.empty?
       cohort = "Unknown"
       break
     elsif @cohort.include?(cohort)
       break
     else
       puts "Cohort does not exist. Please correct any typos"
       cohort = STDIN.gets.chomp.capitalize.to_sym
       break if @cohort.include?(cohort)
     end
   end
  puts "What is #{name}'s favourite hobby?"
  hobby = STDIN.gets.strip.capitalize
  puts "What is #{name}'s country of birth?"
  country_of_birth = STDIN.gets.strip.capitalize
  puts "What is #{name}'s height?"
  height = STDIN.gets.strip
  add_student_to_array(name, cohort, hobby, country_of_birth, height)
  puts @students.count == 1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
  puts "Please enter the student's name"
  name = STDIN.gets.strip
end
puts " "
puts "Option 1 successfully completed".center(@line_width)
puts " "
@students
end

def add_student_to_array(name, cohort, hobby, country_of_birth, height)
  @students << {name: name, cohort: cohort, hobby: hobby, country_of_birth: country_of_birth, height: height}
end

def show_students
  print_header
  print_student_list
  print_footer
  puts "Option 2 successfully completed".center(@line_width)
end

def print_student_list
  if @students.count >= 1
    @students.each do |student|
      puts "Name: #{student[:name]}".center(@line_width)
      puts "Cohort: #{student[:cohort]}".center(@line_width)
      puts "Favourite hobby: #{student[:hobby]}".center(@line_width)
      puts "Country of birth: #{student[:country_of_birth]}".center(@line_width)
      puts "Height: #{student[:height]}".center(@line_width)
      puts " "
    end
  end
end

def print_footer
  puts @students.count == 1 ? "Overall, we have #{@students.count} great student".center(@line_width) : "Overall, we have #{@students.count} great students".center(@line_width)
  puts " "
end

def save_students
  puts "What file would you like to save to? Hit enter to save to students.csv"
  user_file_input = STDIN.gets.strip
  user_file_input.empty? ? user_file_input = "students.csv" : user_file_input
  CSV.open(user_file_input, "w") do |csv|
    @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country_of_birth], student[:height]]
    csv.puts student_data
  end
end
puts "Option 3 successfully completed".center(@line_width)
end

def select_where_to_load_from
    puts "What file would you like to load from? Hit enter to load students.csv"
  user_file_input = STDIN.gets.strip
  if user_file_input.empty?
    user_file_input = "students.csv"
    read_file(user_file_input)
  elsif File.exists?(user_file_input) == false
    puts "Sorry, #{user_file_input} does not exist."
    exit  
  else
    user_file_input
    read_file(user_file_input)
  end
end

def read_file(filename)
  CSV.foreach(filename) do |row|
    name, cohort, hobby, country_of_birth, height = row
      add_student_to_array(name, cohort, hobby, country_of_birth, height)
      puts row
      puts " "
    end
    puts "Option 4 successfully completed".center(@line_width)
    end

def load_students_on_startup
  filename = ARGV.first # First argument from the command line 
  if filename.nil?
    select_where_to_load_from
  elsif File.exists?(filename)
    read_file(filename)
  else
    puts "Sorry #{filename} does not exist."
    exit
  end
end  

def read_source_code
  puts __FILE__
  File.open(__FILE__, 'r') do |file|
      puts file.read
  end  
end

load_students_on_startup
interactive_menu
