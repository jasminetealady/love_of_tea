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
    elsif input == "4"
      cart
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
    puts "\nHello and welcome to Love of Tea. To begin, please select an option by typing the number. You may exit the program at any time by typing exit.\n\n1. Learn More About Tea\n2. A Quote About Tea\n3. Get Matched with A Tea\n4. See Cart\n"
  end

  def match
    puts "\nWhat sort of effect are you looking for in your tea?\n\n1. Energy\n2. Calming\n3. Warming/Spice\n\n"

    effect = gets.strip

    #Energy
    if effect == "1"
      puts "\nPlease choose a caffeine level.\n\n1. Low\n2. Medium\n3. High\n\n"

      caffeine = gets.strip
      if caffeine == "1"

        puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.white.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
            end

          elsif select_or_choose == "2"
            list_white_tea
            choose_from_list = gets.strip.to_i
            tea = LoveOfTea::Tea.white[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

              puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n"

              savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

          else puts "Invalid Input"
            match
          end

      elsif caffeine == "2"

        puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select for me\n2. Choose My Own"
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.green.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
            end

          elsif select_or_choose == "2"
            list_green_tea
            choose_from_list = gets.strip.to_i
            tea = LoveOfTea::Tea.green[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

              puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n"

              savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

          else puts "Invalid Input"
            match
          end

      elsif caffeine == "3"

        puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
        select_or_choose = gets.strip
          if select_or_choose == "1"

            randomtea = LoveOfTea::Tea.black.shuffle.first
            name = randomtea.name
            price = randomtea.price
            description = randomtea.description
            url = randomtea.url

            puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n"

            savetocart = gets.strip
            if savetocart == "y"
              randomtea.save
            else
            end

          elsif select_or_choose == "2"

            list_black_tea
            choose_from_list = gets.strip.to_i
            tea = LoveOfTea::Tea.black[choose_from_list - 1]
            name = tea.name
            price = tea.price
            description = tea.description
            url = tea.url

              puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n"

              savetocart = gets.strip
              if savetocart == "y"
                tea.save
              else
              end

          else puts "Invalid Input"
            match
          end

      end


    #Calming
    elsif effect == "2"

      puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
      select_or_choose = gets.strip
        if select_or_choose == "1"

          randomtea = LoveOfTea::Tea.herbal.shuffle.first
          name = randomtea.name
          price = randomtea.price
          description = randomtea.description
          url = randomtea.url

          puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n"

          savetocart = gets.strip
          if savetocart == "y"
            randomtea.save
          else
          end

        elsif select_or_choose == "2"
          list_herbal_tea
          choose_from_list = gets.strip.to_i
          tea = LoveOfTea::Tea.herbal[choose_from_list - 1]
          name = tea.name
          price = tea.price
          description = tea.description
          url = tea.url

            puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n"

            savetocart = gets.strip
            if savetocart == "y"
              tea.save
            else
            end

        else puts "Invalid Input"
          match
        end

    elsif effect == "3"

      puts "\nWould you like us to select a tea for you? Or would you prefer to choose from a list?\n\n1. Select For Me\n2. Choose My Own\n\n"
      select_or_choose = gets.strip
        if select_or_choose == "1"

          randomtea = LoveOfTea::Tea.chai.shuffle.first
          name = randomtea.name
          price = randomtea.price
          description = randomtea.description
          url = randomtea.url

          puts "\nWe have chosen the lovely #{name} for you. #{description}. Depending on quantity, that will cost #{price}. If the price is fixed, that is the only quantity offered. Enjoy!\n\nWould you like to save this to your cart? (y/n)\n"

          savetocart = gets.strip
          if savetocart == "y"
            randomtea.save
          else
          end

        elsif select_or_choose == "2"
          list_chai_tea
          choose_from_list = gets.strip.to_i
          tea = LoveOfTea::Tea.chai[choose_from_list - 1]
          name = tea.name
          price = tea.price
          description = tea.description
          url = tea.url

            puts "\n#{name}. Excellent choice. #{description}. Depending on quantity that will cost #{price}. If the price is fixed, that is the only quantity offered.\n\nWould you like to save this to your cart? (y/n)\n"

            savetocart = gets.strip
            if savetocart == "y"
              tea.save
            else
            end

        else puts "Invalid Input"
          match
        end

    elsif effect != "exit"
      puts "Invalid input. Please try again."
      match
    else
    end
  end

  def list_white_tea
    puts "\n"
    LoveOfTea::Tea.white.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_green_tea
    puts "\n"
    LoveOfTea::Tea.green.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_black_tea
    puts "\n"
    LoveOfTea::Tea.black.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_herbal_tea
    puts "\n"
    LoveOfTea::Tea.herbal.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def list_chai_tea
    puts "\n"
    LoveOfTea::Tea.chai.each_with_index do |tea, index| puts "#{index + 1}. #{tea.name}"
    end
    puts "\n"
  end

  def cart
    puts "\n"
    LoveOfTea::Tea.cart.each do |tea|
      puts "Name: #{tea.name}\nType: #{tea.type}\nDescription: #{tea.description}\nPrice: #{tea.price}\nCaffeine Level: #{tea.caffeine}\nLink: #{tea.url}\n\n---------------------------"
    end
    puts "\n"
  end

end
