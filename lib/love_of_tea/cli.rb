require_relative '../../config/environment.rb'
require_relative './scraper.rb'
require_relative './tea.rb'

class LoveOfTea::CLI

  def initialize
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/green-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/caffeine-free-herbal")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/white-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/black-tea")
    LoveOfTea::Tea.create_from_collection("https://www.rishi-tea.com/category/chai")
  end

  def call
    menu
    input = gets.strip
    if input == "1"
      learnmore
      call
    elsif input == "2"
      quote
      call
    elsif input == "3"
      match
      call
    elsif input != "exit"
      puts "Invalid input. Please try again."
      call
    else
    end
  end

  def quote
   puts "\n❀ Why not consecrate ourselves to the queen of the Camelias, and revel in the warm stream of sympathy that flows from her altar?  In the liquid amber within the ivory-porcelain, the initiated may touch the sweet reticence of Confucius, the piquancy of Laotse, and the ethereal aroma of Sakyamuni himself. ❀"
  end

  def learnmore
   puts "\n❀ All tea comes from the camellia sinensis plant. Otherwise, it is a tisane. The camellia plant has many health properties, but one of particular interest is its L-Theanine content.\n \n❀ L-theanine has been shown to increase dopamine, serotonin, and GABA in the brain, thus inducing relaxation and positive mood.\n \n❀ Combined with the natural caffeine in the plant, it also improves concentration and memory, which is why monks have used it to meditate for years."
  end

  def menu
    puts "\nHello and welcome to Love of Tea. To begin, let's learn a little bit about tea. To learn more, please type learn more into the console. You may exit the program at any time by typing exit.\n\n1. Learn More About Tea\n2. A Quote About Tea\n3. Get Matched with A Tea\n\n"
  end

  def match
    puts "\nWhat sort of effect are you looking for in your tea?\n\n1. Energy\n2. Calming\n3. Warming/Spice\n\n"

    input = gets.strip

    if input == "1"
      puts "\nPlease choose a caffeine level.\n\n1. Low\n2. Medium\n3. High\n\n"

      input2 = gets.strip
      if input2 == "1"

        puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
        input3 = gets.strip
          if input3 == "1"

            randomtea = LoveOfTea::Tea.white.shuffle.first
            randomteaname = randomtea.name
            price = LoveOfTea::Tea.price_by_name(randomteaname)
            description = randomtea.description

            puts "\nWe have chosen the lovely #{randomteaname} for you. #{description}. Depending on quantity, that will cost #{price}. Enjoy!\n"
          elsif input3 == "2"
            list_white_tea
            input4 = gets.strip.to_i
            tea = LoveOfTea::Tea.white[input4 - 1].name
            price = LoveOfTea::Tea.white[input4 - 1].price
              puts "\nExcellent choice. #{description}. Depending on quantity that will cost #{price}. Please enjoy a sample of #{tea} on us!"
          else puts "Invalid Input"
            match
          end

      elsif input2 == "2"

        puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select for me\n2. Choose My Own"
        input3 = gets.strip
          if input3 == "1"

            randomtea = LoveOfTea::Tea.green.shuffle.first
            randomteaname = randomtea.name
            price = LoveOfTea::Tea.price_by_name(randomteaname)

            description = randomtea.description
            puts "\nWe have chosen the lovely #{randomteaname} for you. #{description}. Depending on quantity, that will cost #{price}. Enjoy!\n"
            
          elsif input3 == "2"
            list_green_tea
            input4 = gets.strip.to_i
            tea = LoveOfTea::Tea.green[input4 - 1].name
            price = LoveOfTea::Tea.green[input4 - 1].price
              puts "\nExcellent choice. #{description}. Depending on quantity that will cost #{price}. Please enjoy a sample of #{tea} on us!"
          else puts "Invalid Input"
            match
          end

      elsif input2 == "3"
        puts "\n"
      end
    elsif input == "2"
      # Herbals yo
    elsif input == "3"
      # Chais mofo

    elsif input != "exit"
      puts "Invalid input. Please try again."
      match
    else
    end
  end

  def list_white_tea
    puts "\n"
    LoveOfTea::Tea.white.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
  end

  def list_green_tea
    puts "\n"
    LoveOfTea::Tea.green.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
  end

  def list_black_tea
    puts "\n"
    LoveOfTea::Tea.black.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
  end

  def list_herbal_tea
    puts "\n"
    LoveOfTea::Tea.herbal.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
  end

  def list_chai_tea
    puts "\n"
    LoveOfTea::Tea.chai.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
  end

end
