require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'classroom'
require_relative 'app_helper'
require_relative 'rental'
require 'set'

class App
  include AppHelper
  attr_accessor :book, :people, :rentals

  def initialize
    @book = []
    @people = []
    @rentals = []
  end

  def list_all_books
    @book.each { |book| puts "Title: \"#{book.title}\", Author: \"#{book.author}\"" }
  end

  def list_all_people
    @people.each do |person|
      puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Student)
      puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" if person.is_a?(Teacher)
    end
  end

  def create_person
    class_name = confirm_class
    speciality = confirm_speciality(class_name)
    age = confirm_age

    puts "Please enter person's name"
    name = gets.chomp
    permission = confirm_permission(class_name)

    student = Student.new(age, '', name, permission)
    teacher = Teacher.new(age, specialty, name)
    if class_name == 'Teacher'
      puts "Teacher Name: #{name} Age: #{age} Specialty: #{speciality}"
      @people << teacher
    else
      puts "Student Name: #{name} Age: #{age} ID: #{student.id}"
      @people << student
    end
  end

  def create_book
    puts 'title: '
    title = gets.chomp
    puts 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    puts "Book made. #{title} by #{author}"
    @book << book
  end

  def create_rental
    if @people.empty?
      puts 'Please add a person to set up a rental'
      return ''
    end
    if @book.empty?
      puts 'Need a book? Please add a book to set up a rental'
      return ''
    end
    person_selection_idx = make_person_selection
    book_selection_idx = make_book_selection
    book = @books[book_selection_idx]
    person = @people[person_selection_idx]
    puts 'please enter correct date format YYYY-MM-DD'
    date = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def list_all_rentals
    puts 'No rentals currently' if @rentals.empty?
    unless @rentals.empty? # rubocop:disable Style/GuardClause
      search_id = find_id
      filtered = @rentals.select { |rental| rental.person.id == search_id }
      filtered.each do |rental|
        puts "Details for Rentals - Date: #{rental.date} Book: #{rental.book.title}
      \sby #{rental.book.author} Rented by: #{rental.person.name}"
      end
    end
  end
end
