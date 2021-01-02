json.company do
   json.name(@company.name)
   json.cnpj(@company.cnpj)
end

json.catalog do 
    json.name(@catalog.name)
    json.items(@items) do |item|
        json.name(item.name)
        json.description(item.description)
        json.price(item.price)
        json.category(item.category.name)
    end
end