# First, ask the user to enter the names of all attending students
def input_students
puts "Please enter the names of the students"
puts "To finish, just hit return twice"
# Create an empty array
students = []
# Get the first name from the user
name = gets.chomp
# While the name variable is not empty, repeat this code
while !name.empty? do
# Add each student hash to the array of hashes 
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
# Prompt the user to enter another student name  
  name = gets.chomp
end
# Return the array of students 
students
end


# This method prints the text in the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# This method prints each student name. It takes one argument called 'name'. 
# When we call the method we pass in our students array of hashes
def print(names)
  names.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# This method prints the footer and the number of students. It takes one argument called 'name'. 
# When we call the method we pass in our students array of hashes
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Here we call each method
# We assign the array of students to the variable 'students' and then pass this variable on the print and print_footer methods
# to the other methods for printing 
students = input_students
print_header
print(students)
print_footer(students)