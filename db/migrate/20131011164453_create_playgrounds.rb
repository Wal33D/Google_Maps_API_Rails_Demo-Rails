class CreatePlaygrounds < ActiveRecord::Migration
  def change
    create_table :playgrounds do |t|
      t.string :name
      t.string :sport
      t.float :latitude
      t.float :longitude
      t.string :street_number
      t.string :route
      t.string :city
      t.string :country
      t.string :postal_code

      t.timestamps
    end
  end
end
