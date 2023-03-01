class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|

      t.timestamps
    end
  end
end
