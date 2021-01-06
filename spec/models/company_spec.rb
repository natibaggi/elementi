require 'rails_helper'

RSpec.describe Company, type: :model do

    context 'válido' do
        it 'empresa deverá ser valida' do
            company = build(:company)

            # rodar
            company.save 

            # expectativas
            expect(company.errors.count).to eq(0)
        end
    end
  
    context 'CNPJ' do 
        it 'retornar invalido quando CNPJ for invalido' do
            # preparacao
            company = build(:company)
            company.cnpj = '123123123123' # invalid CNPJ
            
            # rodar
            company.save 

            # expectativas
            first_error = company.errors.full_messages.first
            expect(first_error).to eq("CNPJ não é válido")
        end
    end

end
