require_relative '../../config/environment.rb'
require_relative './tea.rb'
require_relative './cli.rb'

class LoveOfTea::Scraper


  def self.scrape_by_tea_url(tea_url)
    doc = Nokogiri::HTML(open(tea_url))
    teas = []

    doc.css(".product.clearfix").each do |tea|

      price = tea.css("div.col-xs-12.col-sm-6 div.price.text-center").text.strip.gsub(/\s+/,'')

      price2 = tea.css("div.col-sm-6.mar_btm div.col-sm-12 .price").text.strip.gsub(/\s+/,'')

      tea_hash = {:name => tea.css("h3").text,
        :description => tea.css("div.short-desc").text,
        :price => price,
        :price2 => price2,
        :type => doc.css("header h1").text,
        :url => "https://www.rishi-tea.com" + tea.css("a").attribute("href").value}

        teas << tea_hash

    end

    teas.each do |teahash|
      teahash.delete_if {|key, value| value == nil || value == ""}
    end
    teas
  end

end
