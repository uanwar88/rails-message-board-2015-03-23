class Location < ActiveRecord::Base
  has_many :boards

  def self.seed
    state = "nebraska"
    abbrstate = "ne"
    cities = ["omaha", "lincoln", "bellevue", "grand island", "kearney", "fremont",
      "hastings", "north platte", "norfolk", "columbus"]
    cities.each {|x|
      create(city: x, state: state, abbrstate: abbrstate)
    }
  end

  def self.seed_boards
    locations = all
    titles = ["General", "Events", "Sports", "Social", "News"]
    locations.each { |x|
      titles.each { |title|
        x.boards.create(title: title)
      }
    }
  end

end
