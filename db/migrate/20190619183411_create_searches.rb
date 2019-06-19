class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :companies
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
