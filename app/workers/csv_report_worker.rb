class CsvReportWorker
  include Sidekiq::Worker

  def perform(report_id)
    report = Report.find(report_id)
    ::CsvReportGenerator.new(report).perform
  end
end
