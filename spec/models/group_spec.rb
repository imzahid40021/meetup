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
require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_groups).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:user_groups) }
    it { is_expected.to have_many(:roles).through(:user_groups) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'default scope' do
    it 'returns only non-deleted groups' do
      non_deleted_group = create(:group, is_deleted: false)
      deleted_group = create(:group, is_deleted: true)

      expect(described_class.all).to include(non_deleted_group)
      expect(described_class.all).not_to include(deleted_group)
    end
  end

  describe '#destroy' do
    it 'soft deletes the group' do
      group = create(:group)
      group.destroy
      expect(group.reload.is_deleted).to be_truthy
    end
  end
end
