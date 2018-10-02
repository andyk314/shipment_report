class Invoice < ActiveRecord::Base
  # TODO: add a user/client model to scope the invoices by user
  has_many :packages, dependent: :destroy
  enum invoice_type: %i[ups fedex usps]
end
