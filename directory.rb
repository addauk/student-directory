def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an emopty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "_____________"
end

def print(students)
  s_index = 0
  while s_index < students.count
    student = students[s_index]
    s_name = student[:name]
    if s_name.chr == "A" && s_name.length <12
      $stdout.print s_index + 1
      puts ". #{s_name} (#{student[:cohort]} cohort)"
    end
    s_index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call all the methods
students = input_students
print_header
print(students)
print_footer(students)