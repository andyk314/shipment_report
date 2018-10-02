require 'open-uri'
require 'csv'

class CsvReportGenerator
  def initialize(report)
    @report = report
    @data = ::ReportGenerator.new(report).perform
  end

  def perform
    if csv_file && report.csv_download.attach(csv_file)
      report.update!(status: 'completed')
    end
  end

  def filename
    Rails.root + "reports_#{report.id}.csv"
  end

  def csv_file
    ::CSV.open(filename, 'wb') do |csv|
      csv << header_row
      data.each do |row|
        csv << row
      end
    end
  end

  def header_row
    mapping.keys
  end

  def mapping
    {
      'Invoice Type' => 'invoice_type',
      'Invoice Date' => 'invoice_date',
      'Invoice Amount' => 'invoice_amount',
      'Invoice Reference Number' => 'invoice_reference_number',
      'Number of Packages' => 'number_of_packages',
      'Number of Unique services' => 'number_of_unique_service_names'
    }
  end

  private

  attr_reader :data, :report
end
