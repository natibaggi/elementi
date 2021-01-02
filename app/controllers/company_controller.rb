class CompanyController < ApplicationController    
  def index
    company_id = params[:company_id]

    @company = Company.find(company_id)
    @catalog = @company.catalog
    @items = @catalog.items
  end
end