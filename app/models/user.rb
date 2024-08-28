# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :roles, through: :user_groups

  scope :organizers, lambda { |group|
    joins(:user_groups).where(user_groups: { group_id: group, role_name: "organizer", user_id: group.users })
                       .group(:id)
  }
end 
