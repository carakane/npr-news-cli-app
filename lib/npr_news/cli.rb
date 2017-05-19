class NPRNews::CLI

  def call
    welcome
    divisions
    division_choice
  end

  def welcome
    puts "Welcome to an unofficial NPR News Feed"
    puts "All content in this feed is copyright NPR News"
  end

  def divisions
    #iterates over the news divisions and puts them/or hard coded?/or scraped titles?
    puts "Please choose one of the news divisions by number:"
    puts "1. U.S."
    puts "2. World"
  end

  def division_choice
    input = gets.strip
    if input == "1"
      puts "US Headlines"
    elsif input == "2"
      puts "World Headlines"
    elsif input == "exit"
      puts "Goodbye!"
    end
  end

  def headlines
    #scrape headlines?
  end

end
