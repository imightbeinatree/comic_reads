class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def self.up
create_table :roles_users, :id => false do |t|
    t.references :role, :user
end
execute "insert into roles (name) values ('SuperAdmin')"
execute "insert into roles (name) values ('Admin')"
execute "insert into roles (name) values ('GeneralUser')"
execute "insert into roles_users values ('1','1')"
  end

  def self.down
drop_table :roles_users
execute "delete from roles"
  end
end
