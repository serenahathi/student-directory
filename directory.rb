# First, let's put all students into an array of hashes
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
# This method prints the text in the header
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

# This method prints each student name. It takes one argument called 'name'. 
# When we call the method we pass in our students array of hashes
def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# This method prints the footer and the number of students. It takes one argument called 'name'. 
# When we call the method we pass in our students array of hashes
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# Here we call each method
print_header
print(students)
print_footer(students)