require_relative 'book'
require_relative 'person'
class Rental
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals << self
  end
  attr_accessor :date, :book, :person

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
