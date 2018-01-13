def input_students
puts "Please enter the names of the students"
puts "To finish, just hit return twice"
students = []
name = gets.chomp
while !name.empty? do
  students << {name: name, cohort: :november}
  puts "Now we have #{students.count} students"
  name = gets.chomp
end
students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Ex 1 - Print a number before the name of each student
def print_with_index(names)
  names.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Ex 2 - Only print student names that begin with a certain letter
def print_specific_letter(names, letter)
  names.select do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

# Ex 3 - Only print names that are less than 12 characters long
def print_less_than_twelve_characters(names)
  names.select do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
    end
end

# Ex 4 - Use a loop rather than each() to iterate over the array of students
def print_using_loop(names)
  counter = 0  
  until counter == names.length do
    puts "#{names[counter][:name]} (#{names[counter][:cohort]} cohort)"
    counter +=1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
# print(students)
# print_with_index(students)
# print_specific_letter(students,"S")
# print_less_than_twelve_characters(students)
print_using_loop(students)
print_footer(students)
