class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :url
      t.string :title
      t.string :author

      t.timestamps
    end
  end
end
