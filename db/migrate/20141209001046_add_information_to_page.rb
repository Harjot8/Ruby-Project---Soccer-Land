class AddInformationToPage < ActiveRecord::Migration
  def change
    add_column :pages, :information, :text
  end
end
