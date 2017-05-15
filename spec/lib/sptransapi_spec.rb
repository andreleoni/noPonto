require 'spec_helper'
require './lib/sptransapi'

TOKEN_CONS = '68c53a13edefd596e8fde8044e9589a76f002fd74866a456b3313ec0815968ed'

RSpec.describe SptransModule::Call do
  describe "POST test authorize" do
    it "Autenticação e Credenciais - Autenticação com sucesso" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      expect(instance.authenticate_with_api.status).to eq(200)
      expect(instance.authenticate_with_api.body).to eq("true")
    end

    it "Autenticação e Credenciais - Autenticação com falha" do
      instance = SptransModule::Call.new("asdasdas")

      expect(instance.authenticate_with_api.status).to eq(200)
      expect(instance.authenticate_with_api.body).to eq("false")
    end
  end

  describe "GET Linhas" do
    it "Buscar - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      search_terms = 8000
      response = instance.lines_to_search(search_terms)

      expect(response.is_a? Array).to eq(true)
      # expect(@res.status).to eq(200)
    end

    it "CarregarDetalhes - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      line_code = 8000
      response = instance.lines_load_details(line_code)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "GET Paradas" do
    it "Buscar - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      search_terms = 8000
      response = instance.stop_search(search_terms)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end

    it "BuscarParadasPorLinha - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      line_code = 8000
      response = instance.stop_search_by_line(line_code)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end

    it "BuscarParadasPorCorredor - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      hall_code = 8000
      response = instance.stop_search_by_hall(hall_code)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "GET Corredores" do
    it "Corredores - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      response = instance.halls

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "GET Posição Dos Veículos" do
    it "PosicaoDosVeiculos - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)
      line_code = 8000
      response = instance.vehicles_position(line_code)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "GET Previsão De Chegada" do
    it "PrevisaoDeChegada - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      stop_code = 4200953
      line_code = 8000
      response = instance.arrive_preview_on_stop_by_line(stop_code, line_code)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(200)
    end

    it "Previsao De Chegada De Uma Linha em Todos os Pontos- Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      line_code = 8000
      response = instance.arrive_preview_on_stop_all_points(line_code)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(200)
    end

    it "Previsao De Chegada De Todas as Linhas em um Ponto - Api response == 200" do
      instance = SptransModule::Call.new(TOKEN_CONS)

      stop_code = 4200953
      response = instance.arrive_preview_on_stop(stop_code)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(200)
    end
  end
end
