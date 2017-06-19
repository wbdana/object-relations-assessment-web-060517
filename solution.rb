# Please copy/paste all three classes into this file to submit your solution!

## Start Customer class

class Customer
  attr_accessor :first_name, :last_name, :reviews

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews = []
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.select{|cust| cust.full_name == name}
  end

  def self.find_by_first_name(name)
    self.all.select{|cust| cust.first_name == name}
  end

  def self.all_names
    self.all.each_with_object([]) do |customer, array|
      array << customer.full_name
    end
  end

  def add_review(restaurant, content)
    rev = Review.new(self, restaurant)
    self.reviews << rev
    rest = Restaurant.find_by_name(restaurant)
    rest == [] ? rest = Restaurant.new(restaurant) : rest = Restaurant.find_by_name(restaurant)[0]
    rest.reviews << rev
    rest.customers << self
    rev.restaurant = rest
  end

end

## End Customer class

## Start Review class

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

## End Review class

## Start Restaurant class

class Restaurant
  attr_accessor :name, :reviews, :customers

  @@all = []

  def initialize(name)
    @name = name
    @reviews = []
    @customers = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.select{|rest| rest.name == name}
  end

  def reviews
    @reviews
  end

  def customers
    @customers
  end

end

## End Restaurant class
