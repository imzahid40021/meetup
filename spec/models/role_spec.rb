# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# spec/models/role_spec.rb
require 'rails_helper'

RSpec.describe Role, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:user_groups) }
  end
end
