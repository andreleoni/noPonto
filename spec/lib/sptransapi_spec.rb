require 'spec_helper'
require './lib/sptransapi'

TOKEN_CONS = '68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed'

RSpec.describe SptransModule::Call do
  describe "POST test authorize" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      expect(instance.authenticate_with_api.body).to eq("true")
    end
  end

  describe "POST test not authorized" do
    it "Api response == 200" do
      instance = SptransModule::Call.new("asdasdas")
      expect(instance.authenticate_with_api.body).to eq("false")
    end
  end

  describe "GET to_search lines" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      response = instance.to_search_lines(8000)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "GET stop_search" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      response = instance.stop_search(8000)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end
  end
end
