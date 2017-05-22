class NPRNews::CLI

  def call
    welcome
    divisions
    division_choice
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
      @divisions.each.with_index do |division, i|
        case input
          when  "#{i+1}"
            headlines(@divisions[i].url)
          end
        end
      end
    goodbye
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
