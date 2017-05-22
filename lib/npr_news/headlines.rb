class NPRNews::Headlines
  attr_accessor :title, :snippet, :url

  @@headlines = []
  
  def self.headlines
    self.headline_scrape("http://www.npr.org/sections/us/")
  end

  def self.headline_scrape(division_url)
    doc = Nokogiri::HTML(open(division_url))

    doc.css("article.item.has-image").each do |article| #div.featured # article.item.has-image
      headline = self.new
      headline.title = "test",#article.css("div.item-info h2 a").text,
      headline.url = "test1",#article.css("div.item-info h2 a").attribute("href").value,
      headline.snippet = "test2"#article.css("div.item-info p.teaser a").text.gsub(/(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\s+\d{1,2},\s+\d{4}\s../,"") #.{7}
      binding.pry
      @@headlines << headline
    end
    @@headlines
  end

end