class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.references :round
      t.references :card

      t.timestamps
    end
  end
end
