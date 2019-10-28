class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.belongs_to :user, null: false
      
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
  end
end
