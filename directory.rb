def interactive_menu
  students = []
  loop do
    # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Read the input and save it into a variable
    selection = gets.chomp
    # 3. Do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this wil cause the program to exit
    else
      puts "I don't know what you meant, try again"
    end      
  end
end

# Ex 6 - Centered output
@line_width = 50
@cohort = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December, ""]

# Ex 5 - Added input for hobbies, country of birth and height
def input_students
puts "Please enter the names of the students"
puts "To finish, just hit return twice"
students = []
name = gets.strip.capitalize
while !name.empty? do
# Ex 7 - Asks user to input cohort and converts user input to a symbol.
# Ex 7 - If no input is entered, the student's cohort is given a default value of 'unknown'
# Ex 7 -  If user input includes an element inside the @cohorts array break the loop
# Ex 7 - If user inputs a value that does not match any element inside the @cohorts array, ask them to re-inter input until it matches
puts "Please enter #{name}'s cohort"
# Ex 10 - Replaced ()chomp with ()strip to remove last return character
cohort = gets.strip.capitalize.to_sym
  while true do
    if cohort.empty?
       cohort = "Unknown"
       break
     elsif @cohort.include?(cohort)
       break
     else
       puts "Cohort does not exist. Please correct any typos"
       cohort = gets.chomp.capitalize.to_sym
       break if @cohort.include?(cohort)
     end
   end
  puts "What is #{name}'s favourite hobby?"
  hobby = gets.strip.capitalize
  puts "What is #{name}'s country of birth?"
  country_of_birth = gets.strip.capitalize
  puts "What is #{name}'s height?"
  height = gets.strip
  students << {name: name, cohort: cohort, hobby: hobby, country_of_birth: country_of_birth, height: height}
  # Ex 9 - Amended output to account for singular and plural
  puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
  puts "Please enter the student's name"
  name = gets.strip
end
students
end

def print_header
  puts "The students of Villains Academy".center(@line_width)
  puts "--------------".center(@line_width)
end

def print(names)
# Ex 12 - Do not print list if user has not inputted any students
  if names.count >= 1
    names.each do |student|
      puts "Name: #{student[:name]}".center(@line_width)
      puts "Cohort: #{student[:cohort]}".center(@line_width)
      puts "Favourite hobby: #{student[:hobby]}".center(@line_width)
      puts "Country of birth: #{student[:country_of_birth]}".center(@line_width)
      puts "Height: #{student[:height]}".center(@line_width)
      puts " "
    end
    end
end

def print_footer(names)
  # Ex 9 - Amended output to account for singular and plural
  puts names.count == 1 ? "Overall, we have #{names.count} great student".center(@line_width) : "Overall, we have #{names.count} great students".center(@line_width)
  puts " "
end

interactive_menu



=begin 
Previous exercises

Ex 1 - Print a number before the name of each student
def print_with_index(names)
  names.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

Ex 2 - Only print student names that begin with a certain letter
def print_specific_letter(names, letter)
  names.select do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

Ex 3 - Only print names that are less than 12 characters long
def print_less_than_twelve_characters(names)
  names.select do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

Ex 4 - Use a loop rather than each() to iterate over the array of students
def print_using_loop(names)
  counter = 0  
  until counter == names.length do
    puts "#{names[counter][:name]} #{names[counter][:cohort]} cohort"
    counter +=1
  end
end

Ex 8 - Print students by cohort
def print_by_cohort(names)

sorted_by_cohort = {}  

names.each do |student_hash|
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
=end

