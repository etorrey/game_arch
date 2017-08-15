class CreateSearchHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :search_histories do |t|
      t.column :total, :int
      t.column :keyword, :string
      t.timestamps
    end
  end
end
