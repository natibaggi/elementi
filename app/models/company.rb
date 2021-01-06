class Company < ApplicationRecord
    validates :name, presence: true
    validate :cnpj_validates

    has_one :catalog
    has_many(:categories)


    private
    def cnpj_validates
        if !CNPJ.valid?(cnpj)
            errors.add(:cnpj, " não é válido")
        end
    end

end
