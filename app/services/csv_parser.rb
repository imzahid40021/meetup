# app/services/csv_upload_service.rb
require 'csv'

class CsvParser
  extend Dry::Initializer

  param :csv_file

  def call
    return response(false) unless available_for_read?

    process_csv
  end

  private

  def process_csv
    CSV.parse(csv_file.read, headers: true) do |row|
      first_name = row['First Name']
      last_name = row['Last Name']
      group_name = row['Group Name']
      role_in_group = row['Role in Group']
      role = Role.find_by(name: role_in_group.downcase)
      next if role.blank?

      ActiveRecord::Base.transaction do
        group = Group.find_or_create_by!(name: group_name)
        user = User.find_or_create_by!(first_name: first_name, last_name: last_name)
        UserGroup.find_or_create_by!(user_id: user.id, role_id: role.id, role_name: role.name, group_id: group.id)
      rescue StandardError => e
        Rails.logger.error("Error in CSV processing - #{e}")
        return response(false, e.message)
      end
    end
    response
  end

  def response(success = true, errors = nil)
    {
      success: success,
      errors: errors
    }
  end

  def available_for_read?
    csv_file.present? && csv_file.respond_to?(:read)
  end
end
