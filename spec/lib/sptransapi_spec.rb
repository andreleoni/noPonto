require 'spec_helper'
require 'dotenv/load'
require './lib/sptransapi'

RSpec.describe SptransModule::Call do
  before do
    json = JSON.parse(File.read('./spec/misc/lines.json'))
    @line = json['lines_list'].sample

    json1 = JSON.parse(File.read('./spec/misc/search_terms.json'))
    @term = json1['search_terms'].sample

    json2 = JSON.parse(File.read('./spec/misc/stop_code.json'))
    @stop = json2['stop_lines'].sample

    @instance = SptransModule::Call.new(ENV['SPTRANS_TOKEN'])

    #adicionar @response_status = :success
  end

  describe 'POST test authorize' do
    it 'Autenticação e Credenciais - Autenticação com sucesso' do
      expect(@instance.authenticate_with_api.status).to eq(:success)
      expect(@instance.authenticate_with_api.body).to eq('true')
    end

    it 'Autenticação e Credenciais - Autenticação com falha' do
      instance = SptransModule::Call.new('asdasdas')

      expect(instance.authenticate_with_api.status).to eq(:success)
      expect(instance.authenticate_with_api.body).to eq('false')
    end
  end

  describe 'GET Linhas' do
    it 'Buscar - Api responsem == :success' do
      response = @instance.lines_to_search(@term)

      expect(response.is_a? Array).to eq(true)
      # expect(response.status).to eq(:success)
    end

    it 'CarregarDetalhes - Api response == :success' do
      response = @instance.lines_load_details(@line)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(:success)
    end
  end

  describe 'GET Paradas' do
    it 'Buscar - Api response == :success' do
      response = @instance.stop_search(@term)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(:success)
    end

    it 'BuscarParadasPorLinha - Api response == :success' do
      response = @instance.stop_search_by_line(@line)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(:success)
    end

    it 'BuscarParadasPorCorredor - Api response == :success' do
      response = @instance.stop_search_by_hall(@line)

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(:success)
    end
  end

  describe 'GET Corredores' do
    it 'Corredores - Api response == :success' do
      response = @instance.halls

      expect(JSON.parse(response.body).is_a? Array).to eq(true)
      expect(response.status).to eq(:success)
    end
  end

  describe 'GET Posição Dos Veículos' do
    it 'PosicaoDosVeiculos - Api response == :success' do
      response = @instance.vehicles_position(@line)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(:success)
    end
  end

  describe 'GET Previsão De Chegada' do
    it 'PrevisaoDeChegada - Api response == :success' do
      response = @instance.arrive_preview_on_stop_by_line(@stop, @line)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(:success)
    end

    it 'Previsao De Chegada De Uma Linha em Todos os Pontos- Api response == :success' do
      response = @instance.arrive_preview_on_stop_all_points(@line)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(:success)
    end

    it 'Previsao De Chegada De Todas as Linhas em um Ponto - Api response == :success' do
      response = @instance.arrive_preview_on_stop(@stop)

      expect(JSON.parse(response.body).is_a? Hash).to eq(true)
      expect(response.status).to eq(:success)
    end
  end
end
