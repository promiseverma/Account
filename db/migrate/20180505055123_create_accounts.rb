class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :credit, precision: 8, scale: 2
      t.decimal :debit, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
