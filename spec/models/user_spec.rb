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
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:user_groups).dependent(:destroy) }
    it { is_expected.to have_many(:groups).through(:user_groups) }
    it { is_expected.to have_many(:roles).through(:user_groups) }
  end

  describe 'scopes' do
    describe '.organizers_in_group' do
      let(:user1) { create(:user) }
      let(:user2) { create(:user) }
      let(:organizer_role) { create(:role, name: 'Organizer') }
      let(:participant_role) { create(:role, name: 'Participant') }
      let(:group) { create(:group) }

      before do
        # Create user groups with different roles
        create(:user_group, user: user1, group: group, role: organizer_role)
        create(:user_group, user: user2, group: group, role: participant_role)
      end

      it 'returns users who are organizers in the specified group' do
        organizers = described_class.organizers_in_group(group.id)
        expect(organizers).to include(user1)
        expect(organizers).not_to include(user2)
      end
    end
  end
end
