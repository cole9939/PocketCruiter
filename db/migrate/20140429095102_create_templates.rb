class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.text :description
      t.boolean :is_active
      
      t.timestamps
    end
  end
end
