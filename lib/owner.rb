require 'pry'
class Owner
  attr_reader :name, :species
  attr_accessor :owner
 
  @@all = []
  
  
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end
  

  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select {|cat| cat.owner == self} 
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    cats << Cat.new(name, self)
  end
  
  def buy_dog(name)
    dogs << Dog.new(name, self)
  end
  
  def walk_dogs
    dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    dogs || cats
  end
end