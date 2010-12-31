require File.expand_path(File.dirname(__FILE__) + '/wish')

@wishes = Wish.import("wishes.txt")

def display_heading(heading)
  puts "\n#{heading}\n"
end

def display_breakdown(breakdown)
  @wishes.group_by(&"#{breakdown}".to_sym).each do |breakdown, wishes|
    puts "#{breakdown} | #{wishes.size} | #{((wishes.size/@wishes.size.to_f)*100).to_i}%"
  end
end

display_heading "Total Birthday Wishes: #{@wishes.size}"

display_heading "Breakdown by Medium"
display_breakdown "medium"


display_heading "Breakdown by Relationship"
display_breakdown "relationship"