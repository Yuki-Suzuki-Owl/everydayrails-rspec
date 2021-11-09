class AddCompletedToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :completed, :boolean
  end
end
