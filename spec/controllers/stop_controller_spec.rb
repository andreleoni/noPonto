require 'rails_helper'

RSpec.describe StopController, type: :controller do
  before do
    json = JSON.parse(File.read("./spec/misc/search_terms.json"))
    @term = json['search_terms'].sample(1)

    json = JSON.parse(File.read("./spec/misc/lines.json"))
    @line_code = json['lines_list'].sample(1)
  end

  describe "GET #stop_search" do
    it "Show stop points search results == 200" do
      get :stop_search, :params => {:term => @term}
      expect(response.status).to eql(200)
    end
  end

  describe "GET #load_stop_details" do
    it "Show stop points by line results == 200" do
      get :stop_search_by_line, :params => {:line_code => @line_code}
      expect(response.status).to eql(200)
    end
  end

end
