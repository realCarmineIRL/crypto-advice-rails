class CreateSentiments < ActiveRecord::Migration[6.0]
  def change
    create_table :sentiments do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
