class PackagesController < ApplicationController
  def index
    @packages = Package.all
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)
    if @package.save
      redirect_to packages_url
    else
      render action: 'new'
    end
  end

  private

  def package_params
    params.require(:package).permit(:tracking_number, :service_name, :ship_date, :delivery_date, :expected_delivery_date, :invoice_id)
  end
end
