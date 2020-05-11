require 'httparty'
require 'nokogiri'
require 'byebug'
require 'json'

def all_countries
  unparsed_page = HTTParty.get('https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data#cite_note-15')
  parsed_page = Nokogiri::HTML(unparsed_page)

  records = []
  total_countries = parsed_page.css('#thetable > tbody > tr').map(&:text).count
  

                                    
  i = 0
  while i < total_countries
    record = parsed_page.css("#thetable > tbody > tr[#{i}]").text
    record = record.split("\n")
    
    record_hash = { "location": record[0],
                    "cases": record[1], 
                    "deaths": record[2], 
                    "recoveries": record[3], 
                    "ref": record[4],
                    }
    records << record_hash
    i += 1
  end
 records
 
end

puts all_countries