# First, let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# This method prints the text in the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# This method prints each student name. It takes one argument called 'name'. 
# When we call the method we pass in our students array
def print(names)
  names.each do |student|
    puts student
  end
end

# This method prints the footer and the number of students. It takes one argument called 'name'. 
# When we call the method we pass in our students array
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Here we call each method
print_header
print(students)
print_footer(students)