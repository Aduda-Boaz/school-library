#!/usr/bin/env ruby
require_relative 'app'

class Main
  def display_menu
    puts "\n"
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - exit'
  end

  def main # rubocop:disable Metrics/CyclomaticComplexity
    app = App.new
    user_finished = false
    until user_finished
      display_menu
      selection = gets.chomp.to_i
      case selection
      when 1 then app.list_all_books
      when 2 then app.list_all_people
      when 3 then app.create_person
      when 4 then app.create_book
      when 5 then app.create_rental
      when 6 then app.list_all_rentals
      when 7
        puts 'Bye! Thank you for using the application.'
        user_finished = true
      else
        puts 'Invalid Selection. Please enter a number between 1-7'
      end
    end
  end
end

main = Main.new
main.main
