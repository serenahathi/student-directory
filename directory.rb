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
  file = File.open(user_file_input, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country_of_birth], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
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
file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby, country_of_birth, height = line.chomp.split(",")
  add_student_to_array(name, cohort, hobby, country_of_birth, height)
  puts line
end
file.close
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

load_students_on_startup
interactive_menu






=begin
# Previous exercises - refactored to account for students array now being an instance variable

# Ex 1 - Print a number before the name of each student
def print_with_index
  @students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Ex 2 - Only print student names that begin with a certain letter
def print_specific_letter(letter)
  letter = letter.upcase
  @students.select do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

# Ex 3 - Only print names that are less than 12 characters long
def print_less_than_twelve_characters
  @students.select do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

# Ex 4 - Use a loop rather than each() to iterate over the array of students
def print_using_loop
  counter = 0
  until counter == @students.length do
    puts "#{@students[counter][:name]} #{@students[counter][:cohort]} cohort"
    counter +=1
  end
end

# Ex 8 - Print students by cohort
def print_by_cohort

sorted_by_cohort = {}

@students.each do |student_hash|
  student_cohort = student_hash[:cohort]
  student_names = student_hash[:name]

if sorted_by_cohort[student_cohort] == nil
  sorted_by_cohort[student_cohort] = []
end
  sorted_by_cohort[student_cohort] << student_names
end

puts "Students sorted by cohort:"
sorted_by_cohort.each do |key, value|
  puts " "
  puts key
  puts value
end
end

print_with_index
puts "--"
print_specific_letter("t")
puts "--"
print_less_than_twelve_characters
puts "--"
print_using_loop
puts "--"
print_by_cohort
puts "--"
=end
