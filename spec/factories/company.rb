FactoryBot.define do
  factory :company do
    cnpj { "57650678000137" }
    name  { "Elementos Food" }
    status { 'active' }
  end
end