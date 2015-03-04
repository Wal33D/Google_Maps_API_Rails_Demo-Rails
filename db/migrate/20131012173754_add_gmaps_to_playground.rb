class AddGmapsToPlayground < ActiveRecord::Migration
  def change
    add_column :playgrounds, :gmaps, :boolean
  end
end
