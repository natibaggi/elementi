class Company < ApplicationRecord
    has_one :catalog
    has_many(:categories)

    
    validate :cnpj_validates
    validates :cnpj, uniqueness: true

    validates :name, length: { minimum: 6 }

    validates :status, inclusion: { in: ["active", "inactive"]}


    private
    def cnpj_validates
        if !CNPJ.valid?(cnpj)
            errors.add(:cnpj, "não é válido")
        end
    end

end
