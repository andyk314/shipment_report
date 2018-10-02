class ReportGenerator
  def initialize(report)
    @report = report
  end

  def perform
    invoices.map do |inv|
      format_data(inv)
    end
  end

  def format_data(inv)
    OpenStruct.new(
      invoice_type: inv.invoice_type,
      invoice_date: inv.invoice_date,
      invoice_amount: inv.invoice_amount,
      invoice_reference_number: inv.reference_number,
      number_of_packages: inv.packages.count,
      number_of_unique_service_names: inv.packages.pluck(:service_name).uniq.count
    )
  end

  # Eager load packages
  # Filter invoices by date range
  # Order them by dates in desc order
  # Limit 50
  def invoices
    Invoice
      .includes(:packages)
      .where(invoice_date: date_range)
      .order(invoice_date: :desc)
      .limit(50)
  end

  def date_range
    report.start_date..report.end_date
  end

  private

  attr_reader :report
end
