require 'rails_helper'

RSpec.describe LineController, type: :controller do
  before do
    json = JSON.parse(File.read("./spec/misc/lines.json"))
    @line_code = json['lines_list'].sample(1)

    json = JSON.parse(File.read("./spec/misc/search_terms.json"))
    @term = json['search_terms'].sample(1)
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

  # describe "GET #vehicles_position" do
  #   it "Get position of vehicles of the lines == 200" do
  #     get :vehicles_position, :params => { :line_code => @line_code }
  #     expect(response.is_a? Array).to eql(true)
  #   end
  # end
end
