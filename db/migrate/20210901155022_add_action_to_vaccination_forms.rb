class AddActionToVaccinationForms < ActiveRecord::Migration[6.1]
  def change
    add_column :vaccination_forms, :action, :string
  end
end
