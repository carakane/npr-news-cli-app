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
    puts "All content, copyright NPR News"
  end

  def divisions
    puts "Please choose one of the news divisions by number, or type exit:"
    @divisions = NPRNews::Divisions.division
    @divisions.each.with_index(1) do |division, i|
      puts "#{i}. #{division.name}"
    end
  end

  def divisions_again
    puts "Please choose one of the news divisions by number, or type exit:"
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
          headlines(@divisions[0].url)
        when "2"
          headlines(@divisions[1].url)
        when "3"
          headlines(@divisions[2].url)
        when "4"
          headlines(@divisions[3].url)
        when "5"
          headlines(@divisions[4].url)
        when "6"
          headlines(@divisions[5].url)
        when "7"
          headlines(@divisions[6].url)
        when "8"
          headlines(@divisions[7].url)
        when "9"
          headlines(@divisions[8].url)
      end
    end
  end

  def headlines(division_url)
    @headlines = NPRNews::Headlines.headlines(division_url)
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
    input = gets.strip

    if input == "exit"
      goodbye
    elsif input == "list"
      divisions_again
      division_choice
    else more
    end
  end

  def goodbye
    puts "Come back later for more headlines!"
    exit
  end

end
