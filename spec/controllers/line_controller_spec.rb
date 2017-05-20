require 'rails_helper'

RSpec.describe LineController, type: :controller do
  before do
    json = JSON.parse(File.read("./spec/misc/lines.json"))
    @line_code = json['lines_list'].sample

    json = JSON.parse(File.read("./spec/misc/search_terms.json"))
    @term = json['search_terms'].sample
  end

  describe "GET #search_lines" do
    it "Show search results == 200" do
      get :search_lines, :params => {:term => @term}
      expect(response.status).to eql(200)
    end
  end

  describe "GET #load_line_details" do
    it "Get details of one line == 200" do
      get :load_line_details, :params => {:line_code => @line_code}
      expect(response.status).to eql(200)
    end
  end

  describe "GET #vehicles_position" do
    it "Get position of vehicles of the lines == 200" do
      get :vehicles_position, :format => 'js', xhr: true, :params => { :line_code => @line_code }
      expect(response.status).to eql(200)
    end
  end

  describe "GET #map_route" do
    it "Gets the origin, destination and stop from a line == 200" do
      get :map_route, :params => { :line_code => @line_code, :origin => @term, :destination => @term}
      expect(response.status).to eql(200)
    end
  end
end
