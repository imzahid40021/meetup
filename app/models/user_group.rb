# == Schema Information
#
# Table name: user_groups
#
#  id         :bigint           not null, primary key
#  role_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint           not null
#  role_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_groups_on_group_id  (group_id)
#  index_user_groups_on_role_id   (role_id)
#  index_user_groups_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (role_id => roles.id)
#  fk_rails_...  (user_id => users.id)
#
class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :group

  validates :user_id, uniqueness: { scope: :group_id }
end
