class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
