class RemoveActionToVaccinationForms < ActiveRecord::Migration[6.1]
  def change
    remove_column :vaccination_forms, :action
  end
end
