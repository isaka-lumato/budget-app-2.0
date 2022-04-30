class AddUserRefToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :author, foreign_key: { to_table: :users }
  end
end
