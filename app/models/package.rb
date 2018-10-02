class Package < ActiveRecord::Base
  belongs_to :invoice, dependent: :destroy
end
