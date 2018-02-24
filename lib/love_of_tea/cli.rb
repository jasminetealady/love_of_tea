

class LoveOfTea::CLI

  def call
    puts "Hello and welcome to Love of Tea. To begin, let's learn a little bit about tea. To learn more, please type learn more into the console. You may exit the program at any time by typing exit."
    input = gets.strip
    if input == "learn more"
      firstmenu
    elsif input != "exit"
      puts "Invalid input."
      call
    else
    end
  end

  def quote
   puts "❀ Why not consecrate ourselves to the queen of the Camelias, and revel in the warm stream of sympathy that flows from her altar?  In the liquid amber within the ivory-porcelain, the initiated may touch the sweet reticence of Confucius, the piquancy of Laotse, and the ethereal aroma of Sakyamuni himself. ❀"
  end

  def funfacts
   puts "❀ All tea comes from the camellia sinensis plant. Otherwise, it is a tisane. The camellia plant has many health properties, but one of particular interest is its L-Theanine content.\n \n❀ L-theanine has been shown to increase dopamine, serotonin, and GABA in the brain, thus inducing relaxation and positive mood.\n \n❀ Combined with the natural caffeine in the plant, it also improves concentration and memory, which is why monks have used it to meditate for years."
  end

  def firstmenu
    puts "Great! Which would you like to hear? Please type exit when you are done. \n 1. A quote \n 2. Fun Facts"
      input2 = gets.strip
        if input2 == "1"
          quote
          firstmenu
        elsif input2 == "2"
          funfacts
          firstmenu
        else "invalid input" && call
        end
  end


end
