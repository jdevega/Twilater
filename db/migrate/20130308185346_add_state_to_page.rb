class AddStateToPage < ActiveRecord::Migration
  def change
    add_column :pages, :state, :integer, :default => 0
  end
end
