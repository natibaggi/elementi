class Backoffice::CompaniesController < ApplicationController

    layout('backoffice')

    def index
        @companies = Company.all
    end

    def new

    end

end