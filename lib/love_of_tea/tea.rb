require_relative '../../config/environment.rb'
require_relative './scraper.rb'
require_relative './cli.rb'

class LoveOfTea::Tea
  attr_accessor :name, :type, :price, :description, :caffeine, :url

  @@all = []
  @@cart = []

  def initialize(teahash)
    @name = teahash[:name]
    @type = teahash[:type]
    @price = teahash[:price] ? teahash[:price] : teahash[:price2]
    @description = teahash[:description]
    @caffeine = if teahash[:type] == "Green" then "medium" elsif teahash[:type] == "White" then "low" elsif teahash[:type] == "Black" then "high" else nil end
    @url = teahash[:url]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end

  def self.create_from_collection(tea_url)
    LoveOfTea::Scraper.scrape_by_tea_url(tea_url).each do |teahash|
    self.new(teahash)
    end
  end

  def self.green
    @@all.reject {|tea| tea.type != "Green"}
  end

  def self.white
    @@all.reject {|tea| tea.type != "White"}
  end

  def self.black
    @@all.reject {|tea| tea.type != "Black"}
  end

  def self.herbal
    @@all.reject {|tea| tea.type != "Herbal"}
  end

  def self.chai
    @@all.reject {|tea| tea.type != "Chai"}
  end

  def self.price_by_name(teaname)
    tea = @@all.detect {|tea| tea.name == teaname}
    tea.price
  end

  def save
    @@cart << self
  end

  def self.cart
    @@cart
  end

end
