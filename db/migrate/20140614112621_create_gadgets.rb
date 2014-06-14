class CreateGadgets < ActiveRecord::Migration
  def change
    create_table :gadgets do |t|
      t.string :name, null: false, default: ''
      t.belongs_to :user

      t.timestamps
    end
  end
end
