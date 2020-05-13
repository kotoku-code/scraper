require 'httparty'
require 'nokogiri'
require 'byebug'
require 'json'

class Scraper
  attr_reader :url, :parsed_page, :unparsed_page

  def initialize
    @url = 'https://www.worldometers.info/coronavirus/'
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(unparsed_page)
    @data = []
  end

  def covid
    covid_data = parsed_page.css('table#main_table_countries_today > tbody > tr')
      .map(&:text).count
    i = 1
    while i < covid_data
      table_data = parsed_page.css("table#main_table_countries_today > tbody >
                              tr[#{i}]").text
      table_data = table_data.split("\n")
      data_hash = { "name": table_data[1],
                    "total_cases": table_data[2],
                    "new_cases": table_data[3],
                    "total_deaths": table_data[4],
                    "new_deaths": table_data[5],
                    "total_recovered": table_data[6],
                    "active_cases": table_data[7],
                    "first_case": table_data[8] }
      data << data_hash
      i += 1
    end
    data
  end
end
