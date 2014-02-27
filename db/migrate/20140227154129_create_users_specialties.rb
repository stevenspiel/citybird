class CreateUsersSpecialties < ActiveRecord::Migration
  def change
    create_table :users_specialties do |t|
    	t.references :user
    	t.references :specialty
    end
  end
end
