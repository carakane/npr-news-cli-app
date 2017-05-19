class NPRNews::News
  attr_accessor :title, :snippet, :url
  # current thinking is that maybe divisions should be hard coded.
  # def self.division
  #   #should return division instances, divisions have names
  #   division_1 = "U.S."
  #   division_2 = "World"
  # end

  def self.headlines
    #should return headlines, headlines also have snippets and URLs
    headline_1 = self.new
    headline_1.title = "Test Title"
    headline_1.snippet = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    headline_1.url = "http://www.npr.org/sections/health-shots/2017/05/19/528516985/poll-doctors-are-still-prescribing-lots-of-opioids-for-low-back-pain"

    headline_2 = self.new
    headline_2.title = "2nd Test Title"
    headline_2.snippet = "2nd Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    headline_2.url = "http://www.npr.org/sections/health-shots/2017/05/19/528516985/poll-doctors-are-still-prescribing-lots-of-opioids-for-low-back-pain"

    [headline_1, headline_2]
  end

end
