class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full_url
      t.string :shortened_url
      t.integer :counter, :default => 0


      t.timestamps
    end
  end
end
