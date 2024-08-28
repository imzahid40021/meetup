# app/services/csv_upload_service.rb
require 'csv'

class CsvParser
  extend Dry::Initializer

  param :csv_file

  def call
    CSV.parse(@csv_file.read, headers: true) do |row|
      first_name = row['First Name']
      last_name = row['Last Name']
      group_name = row['Group Name']
      role_in_group = row['Role in Group']

      role = Role.find_by(name: role_in_group.downcase)

      return if role.nil?

      group = Group.find_or_create_by(name: group_name)
      user = User.find_or_create_by(first_name: first_name, last_name: last_name)
      UserGroup.find_or_create_by(user_id: user.id, role_id: role.id, group_id: group.id)
    end
  end
end
