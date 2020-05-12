# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'byebug'
require 'json'


def covid
  unparsed_page = HTTParty.get('https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data#cite_note-15')
  parsed_page = Nokogiri::HTML(unparsed_page)

  data = []
  covid_data = parsed_page.css('#thetable > tbody > tr').map(&:text).count

  i = 0
  while i < covid_data
    table_data = parsed_page.css("#thetable > tbody > tr[#{i}]").text
    table_data = table_data.split("\n")

    data_hash = { "location": table_data[0],
                  "cases": table_data[1],
                  "deaths": table_data[2],
                  "recoveries": table_data[3],
                  "ref": table_data[4] }
    data << data_hash
    i += 1
  end
  data
end

puts covid
