class CreateSceneries < ActiveRecord::Migration[5.1]
  def change
    create_table :sceneries do |t|
      t.string :name
      t.string :location
      t.string :image_url

      t.timestamps
    end
  end
end
