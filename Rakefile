require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console do
 Pry.start
end

task :scrape_rooms do
  #Instantiate a Scraper and the have it find new rooms
  nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo')
  nyc_scraper.call
  # chicago_scraper = RoomScraper.new('https://chicago.craigslist.org/search/roo')
  # chicago_scraper.call
  #After this method call I should be able to say Room.all and have rooms there.
end
