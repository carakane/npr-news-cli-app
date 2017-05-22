class NPRNews::Divisions
  attr_accessor :name, :url

  @@divisions = []

  def self.division
    doc = Nokogiri::HTML(open("http://www.npr.org/sections/news/"))

    doc.css("div.subtopics li").each do|div|
      division = self.new
      division.name = div.css("a").text
      division.url = "http://www.npr.org#{div.css("a").attribute("href").value}"
      @@divisions << division
    end
    @@divisions
  end

end
