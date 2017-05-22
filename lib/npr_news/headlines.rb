class NPRNews::Headlines
  attr_accessor :title, :snippet, :url

  @@headlines = []

  def self.headlines(division_url)
    self.headline_scrape(division_url)
  end

  def self.headline_scrape(division_url)
    doc = Nokogiri::HTML(open(division_url))
    @@headlines.clear
    doc.css("article.item.has-image").each do |article|
      headline = self.new
      headline.title = article.css("div.item-info h2 a").text
      headline.url = article.css("div.item-info h2 a").attribute("href").value
      headline.snippet = article.css("div.item-info p.teaser a").text.gsub(/(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\s+\d{1,2},\s+\d{4}\s../,"") #.{7}
      #binding.pry
      @@headlines << headline
    end
    @@headlines
  end

end
