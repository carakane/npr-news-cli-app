class NPRNews::CLI

  def call
    welcome
    divisions
    division_choice
    #more
    #goodbye
  end

  def welcome
    puts "Welcome to an unofficial NPR News Feed"
    puts "All content in this feed is copyright NPR News"
  end

  def divisions
    #iterates over the news divisions and puts them/or hard coded?/or scraped titles?
    puts "Please choose one of the news divisions by number, or type exit:"
    @divisions = NPRNews::Divisions.division
    @divisions.each.with_index(1) do |division, i|
      puts "#{i}. #{division.name}"
    end
  end

  def division_choice
    input = nil
    while input != "exit"
      input = gets.strip
      case input
        when "1"
          headlines
        when "2"
          headlines
      #not quite right. user has to choose division, then that choice has to be used to scrape headlines.
      #possible that headlines method could stay the same regardless of division, since pages appear
      #to be coded identically on first glance. this means that division_choice bears the responsibility
      #of sending correct division website to headlines, so headlines probably will take in an argument
      #of the division
      end
    end
  end

  def headlines
    @headlines = NPRNews::Headlines.headlines
    @headlines.each.with_index(1) do |head, i|
      puts "#{i}. #{head.title}"
      puts "---#{head.snippet}"
      puts "(#{head.url})"
      puts "\n"
    end
    more
  end

  def more
    puts "Type list to view the news divisions again, or type exit."
    #input = nil
    input = gets.strip

    if input == "exit"
      goodbye
    elsif input == "list"
      divisions
    else more
    end
  end

  def goodbye
    puts "Come back later for more headlines!"
    exit
  end

end
