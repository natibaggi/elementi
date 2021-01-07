class Backoffice::CompaniesController < ApplicationController
    layout('backoffice')

    def index
        @companies = Company.all
    end

    def new
        @company = Company.new(status: "Active")
    end

    def create        
        company_params = params.require(:company).permit(:cnpj, :name, :status)

        @company = Company.new(company_params)
        if @company.save
            flash[:notice] = "Empresa salva com sucesso!"
            redirect_to backoffice_companies_path
        else
            flash.now[:error] = @company.errors.full_messages
            render :new
        end 
    end

    def edit
        id = params[:id]
        @company = Company.find(id)
    end

    def update
        id = params[:id]
        @company = Company.find(id)
        if @company.update(params.require(:company).permit(:name, :status))
            flash[:notice] = "Produto atualizado com sucesso!"
            redirect_to backoffice_companies_path
        else
            flash.now[:error] = @company.errors.full_messages
            render :edit
        end
    end

    def show
        id = params[:id]
        @company = Company.find(id)
    end


end