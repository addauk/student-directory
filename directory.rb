def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  #create an empty array
  students = []
  #get the first name
  name = gets.sub("\n","")
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
    plural = "student"
    if students.count > 1 
      plural = "students"
    end
    puts "Now we have #{students.count} #{plural}"
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
  plural = "student"
  if students.count > 1 
    plural = "students"
  end
  puts "Overall, we have #{students.count} great #{plural}".center(CENTER_SPACE)
end

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

#nothing happens until we call all the methods
CENTER_SPACE = 50
interactive_menu



#students = input_students
#puts students
#CENTER_SPACE = 50
#print_header
#cohorts = students.map{|student| student[:cohort]}.uniq
#cohorts.each do |cohort|
#  temp = students.select{|student| student[:cohort] == cohort.to_sym}
#  print(temp)
#end
#print_footer(students)