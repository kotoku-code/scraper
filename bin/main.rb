#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'

start = Scraper.new
puts start.covid.inspect
