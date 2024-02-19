module Developers
  class ServicesController < ApplicationController
    # before_action :authenticate_user!
    before_action :set_developer

    def index
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
      @service.developer = current_user.developer
      if @service.save
        flash[:notice] = "Service created successfully"
        redirect_to root_path
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
      params.require(:developers_service).permit(:name, :description, :service_type, :rate, :active)
    end

    def set_developer
      @developer = Developer.find_by_hashid!(params[:developer_id])
    end
  end
end
