

class LoveOfTea::CLI

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
    puts "\nMatching you with the perfect tea..."
  end

end
