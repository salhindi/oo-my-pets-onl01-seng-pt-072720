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
  
  def buy_cat(cat)
    cats << Cat.new(name, self)
  end
end