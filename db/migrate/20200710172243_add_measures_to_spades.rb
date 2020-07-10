class AddMeasuresToSpades < ActiveRecord::Migration[6.0]
  def change
    add_column :spades, :color, :string
    add_column :spades, :width, :integer
    add_column :spades, :length, :integer
  end
end
