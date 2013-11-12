class AddAuthorToPosts < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.string :author
    end
  end
end
