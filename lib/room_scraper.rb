class RoomScraper

  def initialize(index_url)
    @index_url = index_url
    @doc = Nokogiri::HTML(open(index_url))
    # binding.pry
  end

  # def rows
  #    @rows ||= @doc.search("div.content ul.rows li.result-row")
  #    #||= means that if @rows already exist, leave it alone dont do anything
  #    #if @rows does not exist then doc.search
  # end

  def call
    rows.each do |row_doc|
      Room.create_from_hash(scrape_row(row_doc))
      # Room.save #This should put the room in the database
    end
  end

  private
    def rows
      @rows ||= @doc.search("div.content ul.rows li.result-row")
    end

    def scrape_row(row)
      #scrape an individual row
      {
      :date_created => row.search("time").attribute("datetime").text,
      :title => row.search("a.result-title").first.text,
      :url => "#{@index_url}#{row.search("a.hdrlnk").attribute("href").text}",
      :price => row.search("span.result-meta span.result-price").first.text,
    }
    end


  # def scrape_time
  #class
  #   #@doc.search(p.class(result-info) time class "result-date")
  #@doc.search("p.result-info time").first
  #   #datetime
  #   #@doc.search
  #
  #   @rows ||= @doc.search("div.content class.rows p.row")
  #
  # end

end
