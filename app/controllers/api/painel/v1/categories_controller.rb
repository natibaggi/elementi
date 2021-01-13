class Api::Painel::V1::CategoriesController < Api::PainelApiBaseController
  include Api::Painel::V1

  api :GET, '/painel/v1/categories', 'Lista as categorias de uma empresa'
  def index
    categories = Category.where(company: current_company).all
    render json: categories, each_serializer: CategorySerializer
  end

  api :GET, '/painel/v1/categories/:id', 'Pega os detalhes de uma categoria específica'
  param :id, :number, desc: 'ID da categoria que deseja pegar os detalhes'
  def show
    category = Category.where(company: current_company).find(params[:id])
    render json: category, serializer: CategorySerializer
  end

  api :POST, '/painel/v1/categories', 'Cria uma categoria'
  param :name, String, desc: 'Nome da categoria'
  def create
    category = Category.new(name: params[:name], company: current_company)
    if category.save
      render json: category, serializer: CategorySerializer
    else
      render_failure category.errors.full_messages
    end
  end
end

