class AddFieldsToSpades < ActiveRecord::Migration[6.0]
  def change
    add_column :spades, :cost, :integer
    add_column :spades, :product_name, :string
  end
end
