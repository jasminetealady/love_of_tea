require_relative '../../config/environment.rb'

# doc.css(".product.clearfix div.col-xs-12.col-sm-6 div.price.text-center").text.strip.gsub(/\s+/,'') --locate prices of fixed quantities
# doc.css(".product.clearfix div.col-sm-6.mar_btm div.col-sm-12 .price").text.strip.gsub(/\s+/,'') --locate prices of teas with quantity options

class LoveOfTea::Scraper


  def self.scrape_by_tea_url(tea_url)
    doc = Nokogiri::HTML(open(tea_url))
    teas = []

    doc.css(".product.clearfix").each do |tea|

      priceclass1 = tea.css("div.col-xs-12.col-sm-6 div.price.text-center").text.strip.gsub(/\s+/,'')
      priceclass2 = tea.css("div.col-sm-6.mar_btm div.col-sm-12 .price").text.strip.gsub(/\s+/,'')

      tea_hash = {:name => tea.css("h3").text,
        :description => tea.css("div.short-desc").text,
        :price => priceclass1,
        :price2 => priceclass2,
        :type => doc.css("header h1").text}

        teas << tea_hash
    end
    teas
  end

  def self.greenteas
    self.scrape_by_tea_url("https://www.rishi-tea.com/category/green-tea")
  end

  def self.refine_greentea_hash
    greenteas = self.greenteas
    greenteas.each do |teahash|
      teahash.delete_if {|key, value| value == nil || value == ""}
    end
    greenteas
    #this method/green teas returns an array of hashes. to initialize tea with a hash, set up tea class to add attributes from hash and use each to create Tea objects from this collection and store them in @@all
  end

end


LoveOfTea::Scraper.scrape_by_tea_url("https://www.rishi-tea.com/category/green-tea")
