require 'spec_helper'
require './lib/sptransapi'

TOKEN_CONS = '68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed'

RSpec.describe SptransModule::Call do
  it "has a version number" do
    expect(SptransModule::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  describe "POST test authorize" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      expect(instance.authenticate_with_api.parsed_response).to eq(true)
    end
  end

  describe "POST test not authorized" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(" ")
      expect(instance.authenticate_with_api.parsed_response).to eq(false)
    end
  end

  describe "GET to_search lines" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      response = instance.to_search_lines(9000)

      expect(response["code"]).to eq(200)
    end
  end

  describe "GET stop_search" do
    it "Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      response = instance.stop_search(9000)

      expect(response["code"]).to eq(200)
    end
  end
end
