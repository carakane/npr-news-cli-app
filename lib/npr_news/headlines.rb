class NPRNews::Headlines
  attr_accessor :title, :snippet, :url, :division, :name, :headline

  @@headlines = []
  
  def self.headlines
    #should return headlines, headlines also have snippets and URLs
    # headline_1 = self.new
    # headline_1.title = "Test Title"
    # headline_1.snippet = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    # headline_1.url = "http://www.npr.org/sections/health-shots/2017/05/19/528516985/poll-doctors-are-still-prescribing-lots-of-opioids-for-low-back-pain"
    #
    # headline_2 = self.new
    # headline_2.title = "2nd Test Title"
    # headline_2.snippet = "2nd Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    # headline_2.url = "http://www.npr.org/sections/health-shots/2017/05/19/528516985/poll-doctors-are-still-prescribing-lots-of-opioids-for-low-back-pain"
    #
    # [headline_1, headline_2]
    self.headline_scrape("http://www.npr.org/sections/us/")
  end

  def self.headline_scrape(division_url)
    division_url = "http://www.npr.org/sections/us/"
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
      #featured
    #title doc.css("article h2").first.text
    #url doc.css("article h2 a").first.attribute("href").value
    #snippet doc.css("article p.teaser a").first.text.gsub(/(Jan(uary)?|Feb(ruary)?|Mar(ch)?|Apr(il)?|May|Jun(e)?|Jul(y)?|Aug(ust)?|Sep(tember)?|Oct(ober)?|Nov(ember)?|Dec(ember)?)\s+\d{1,2},\s+\d{4}\s.{7}/,"")
  end

end