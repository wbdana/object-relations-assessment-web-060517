class Review

  @@all = []

  attr_accessor :customer, :restaurant
  attr_reader :first_name, :last_name

  def initialize(customer, restaurant)
    @customer = customer
    @restaurant = restaurant
    @@all << self
  end

  def self.all
    @@all
  end

end
