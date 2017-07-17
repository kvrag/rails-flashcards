class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.references :user
      t.references :deck

      t.timestamps
    end
  end
end
