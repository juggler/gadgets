class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.belongs_to :gadget

      t.timestamps
    end
  end
end
