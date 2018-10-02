class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_url
    else
      render action: 'new'
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:invoice_amount, :invoice_date, :invoice_number, :invoice_type, :reference_number)
  end
end
