def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter their cohort"
    cohort = nil
    until cohort
      cohort = gets.chomp
      cohort = validate_cohort(cohort)
    end
    puts "Please enter their country of birth"
    cob = gets.chomp
    puts "Please enter their date of birth"
    dob = gets.chomp
    puts "Please enter their favourite hobby"
    hobby = gets.chomp
    puts "Please enter their height in cm"
    height = gets.chomp
    #add the student hash to the array
    students << {name: name,
      birth_country: cob,
      hobby:hobby,
      date_of_birth:dob,
      height:height,
      cohort: cohort}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def validate_cohort(cohort)
  valid =["january","february","march","april","may",
  "june","july","august","september","october","november","december"]
  cohort = cohort.downcase
  if valid.include?(cohort)
    return cohort.to_sym
  end
  puts "Please enter a valid cohort (a month)"
  nil
end

def print_header()
  puts "The students of Villains Academy".center(CENTER_SPACE)
  puts "_____________".center(CENTER_SPACE)
end

def print(students)
  s_index = 0
  while s_index < students.count
    student = students[s_index]
    s_name = student[:name]
    if s_name.chr == "A" && s_name.length <12 
      puts "#{s_index + 1}. #{s_name} (#{student[:cohort]} cohort)".center(CENTER_SPACE)
    end
    s_index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(CENTER_SPACE)
end

#nothing happens until we call all the methods
students = input_students
CENTER_SPACE = 50
print_header
print(students)
print_footer(students)