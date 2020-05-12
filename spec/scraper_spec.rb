require_relative '../lib/scraper.rb'

RSpec.describe Scraper do
  let(:scraper) { Scraper.new }
  let(:scrape2) { instance_double('scraper') }

  describe '#initialize' do
    url = 'https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data#cite_note-15'
    it 'should check if @url is equal to the url described here' do
      expect(scraper.instance_variable_get(:@url)).to eq(url)
    end

    it 'url should not be an empty string' do
      expect(scraper.instance_variable_get(:@url)).not_to eq('')
    end

    it 'should check if data is an empty array' do
      expect(scraper.instance_variable_get(:@data)).to eq([])
    end

    it 'data should not have any elements in array ' do
      expect(scraper.instance_variable_get(:@data)).not_to eq([''])
    end
  end