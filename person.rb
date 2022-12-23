require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def super(name: 'Unknown', age: 0, parent_permission: true)
    @id = SecureRandom.uuid
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental)
    person.rental = self
  end

  private

  def of_age?
    @age >= 18
  end

  def correct_name
    @name
  end
end
