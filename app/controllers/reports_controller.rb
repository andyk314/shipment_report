class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    # Generate a preview of the reports
    report = Report.find(params[:id])
    @reports = ::ReportGenerator.new(report).perform
  end

  def new
    @report = Report.new
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to reports_url
    else
      render action: 'new'
    end
  end

  private

  def report_params
    params.require(:report).permit(:start_date, :end_date)
  end
end
