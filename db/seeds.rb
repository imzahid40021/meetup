# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

groups_data = [
  { name: 'Ruby Enthusiasts' },
  { name: 'Python Developers' },
  { name: 'JavaScript Masters' }
]

# Create groups
groups_data.each do |group_data|
  Group.find_or_create_by(name: group_data[:name])
end

Rails.logger.debug 'Groups seeded successfully!'

roles_data = [
  { name: 'organizer' },
  { name: 'presenter' },
  { name: 'participant' }
]

# Create roles
roles_data.each do |role_data|
  Role.find_or_create_by(name: role_data[:name])
end

Rails.logger.debug 'Roles seeded successfully!'
