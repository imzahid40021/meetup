# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  is_deleted :boolean          default(FALSE)
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_is_deleted  (is_deleted)
#
class Group < ApplicationRecord

  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :roles, through: :user_groups

  default_scope -> { where(is_deleted: false) }

  validates :name, presence: true, uniqueness: { scope: :is_deleted }

  def destroy
    update(is_deleted: true)
  end
end
