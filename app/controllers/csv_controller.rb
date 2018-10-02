class CsvController < ApplicationController
  # Endpoint to kick off worker to generate report and save to active storage/s3
  # If success, will update the status from pending to complete
  # Possibly we can incoporate action cable or pusher to notify user a report is completed
  def show
    if ::CsvReportWorker.perform_async(params[:id])
      redirect_to reports_url
    end
  end
end
