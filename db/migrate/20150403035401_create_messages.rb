class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.column :body, :string
      t.column :to, :string
      t.column :from, :string


      t.timestamps
    end
      add_column :users, :phone, :string
  end
end
