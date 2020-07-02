class CreateSpades < ActiveRecord::Migration[6.0]
  def change
    create_table :spades do |t|

      t.timestamps
    end
  end
end
