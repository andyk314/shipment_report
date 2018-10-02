class Report < ActiveRecord::Base
  # use active storage to store generated csv file
  # todo: configured with amazon s3
  has_one_attached :csv_download

  enum status: %i[pending completed error], _prefix: :status

  default_scope { where(is_deleted: false) }

  # override destroy method to soft delete report
  def destroy
    update_attribute :is_deleted, true
  end
end
