class Api::Painel::V1::CategorySerializer < ActiveModel::Serializer
  attributes :name, :created_at, :updated_at
end
