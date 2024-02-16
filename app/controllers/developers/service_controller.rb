module Developers
  class ServiceController < ApplicationController
    def index
      # @services = Service.all
      @services = current_user.developer.services
    end

    def show
      @service = Service.find(params[:id])
    end

    def new
      @service = Service.new
    end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to developers_service_index_path
      else
        render :new
      end
    end

    def edit
      @service = Service.find(params[:id])
    end

    def update
      @service = Service.find(params[:id])
      if @service.update(service_params)
        redirect_to developers_service_index_path
      else
        render :edit
      end
    end

    def destroy
      @service = Service.find(params[:id])
      @service.destroy
      redirect_to developers_service_index_path
    end

    private

    def service_params
      params.require(:service).permit(:name, :description, :service_type, :rate, :active)
    end
  end
end
