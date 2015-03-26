class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.column :content, :string
    	t.column :name, :string

    	t.timestamps
    end
  end
end
