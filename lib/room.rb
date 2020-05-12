class Room
  attr_accessor :title, :date_created, :price, :url

  def self.create_from_hash(hash) #instantiantate and save
    new_from_hash(hash).save
  end

  def self.new_from_hash(hash) #Just instantiating
    room = self.new
    room.title = hash[:title]
    room.date_created = hash[:date_created]
    room.price = hash[:price]
    room.url = hash[:url]
    # binding.pry
    room
  end

  def self.all
    sql = <<-SQL
      SELECT * FROM rooms;
    SQL

    rows = DB[:connection].execute(sql)

    #go from a row
  end

  def save
    #I need a database!!!
    puts "YOU ARE ABOUT TO save #{self}"
    sql = <<-SQL
    INSERT INTO rooms (title, date_created, price, url) VALUES (?, ?, ?, ?)

    SQL
    DB[:connection].execute(sql, self.title, self.date_created, self.price, self.url)
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS rooms(
        id INTEGER PRIMARY KEY,
        title TEXT,
        date_created DATETIME,
        price TEXT,
        url TEXT
      )
    SQL
    binding.pry
    DB[:connection].execute(sql)
  end

end
