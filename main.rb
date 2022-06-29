#!/usr/bin/env ruby
require_relative 'app'
require_relative 'display'

class Main < Display
  def main # rubocop:disable Metrics/CyclomaticComplexity
    system('cls')
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
