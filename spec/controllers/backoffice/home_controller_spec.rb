require 'rails_helper'

RSpec.describe Backoffice::HomeController, type: :request do
  describe "GET index" do
    it "should render welcome message" do
      get '/backoffice/'

      expect(response.body).to include("Seja bem vindo ao Backoffice!")
    end
  end
end