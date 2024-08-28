# == Schema Information
#
# Table name: user_groups
#
#  id         :bigint           not null, primary key
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
# spec/models/user_group_spec.rb
require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
    it { is_expected.to belong_to(:group) }
  end

  describe 'validations' do
    let!(:user_group) { FactoryBot.create(:user_group) }

    it 'validates uniqueness of user_id scoped to group_id' do
      duplicate_user_group = FactoryBot.build(:user_group, user_id: user_group.user_id, group_id: user_group.group_id)

      expect(duplicate_user_group).not_to be_valid
      expect(duplicate_user_group.errors[:user_id]).to include('has already been taken')
    end
  end
end
