class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :invoice_type
      t.date :invoice_date
      t.integer :invoice_amount
      t.string :reference_number

      t.timestamps
    end
  end
end
