require 'rails_helper'

RSpec.describe Backoffice::CompaniesController, type: :request do
  describe "GET index" do
    it "retornar listagem de empresas" do
      # preparar cenario
      company = create(:company)
      
      # acao
      get backoffice_companies_path

      # expectativas
      expect(response.body).to include('Listagem de empresas')
      expect(response.body).to include(company.id.to_s)
      expect(response.body).to include(company.name)
      expect(response.body).to include(company.cnpj)
      expect(response.body).to include(company.status)
    end
  end

  describe "POST create" do
    it "deve criar uma empresa" do     
      # acao
      post backoffice_companies_path, params: {
        company: {
          cnpj: '57650678000137',
          name: 'empresa nova',
          status: 'active'
        }
      }

      company = Company.first
      catalog = company.catalog

      # expectativas
      expect(company.cnpj).to eq('57650678000137')
      expect(company.name).to eq('empresa nova')
      expect(company.status).to eq('active')

      expect(catalog).to_not eq(nil)
      expect(catalog.name).to eq('Catálogo Principal')
      expect(catalog.status).to eq('active')
    end
  end

  describe "PUT update" do
    it "deve atualizar a empresa" do
      # preparar cenario
      company = create(:company)
      
      # acao
      put backoffice_company_path(company), params: {
        company: {
          name: 'empresa atualizada',
          status: 'inactive'
        }
      }

      company.reload # busco as atualizacoes no BD

      # expectativas
      expect(company.name).to eq('empresa atualizada')
      expect(company.status).to eq('inactive')
    end

    it "CNPJ da empresa NÃO pode ser alterado" do
      # preparar cenario
      company = create(:company)
      
      # acao
      put backoffice_company_path(company), params: {
        company: {
          cnpj: '34702642000154',
          name: 'empresa atualizada',
          status: 'inactive'
        }
      }

      company.reload # busco as atualizacoes no BD

      # expectativas
      expect(company.cnpj).to_not eq('34702642000154')
    end

    context 'falhas' do 
      it "apresentar mensagem de erro quando atualizacao for inválida" do
        # preparar cenario
        company = create(:company)
        
        # acao
        put backoffice_company_path(company), params: {
          company: {
            name: '', # name can't be blank
            status: 'inactive'
          }
        }

        company.reload # busco as atualizacoes no BD

        # expectativas
        expect(company.status).to eq('active') # deve continuar active
        expect(response.body).to include('Nome não pode ficar em branco')
      end
    end
  end
end