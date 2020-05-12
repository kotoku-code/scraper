require_relative '../lib/scraper.rb'

RSpec.describe Scraper do
  let(:scraper) { Scraper.new }
  let(:scrape2) { instance_double('scraper') }

