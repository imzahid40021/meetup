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
require "test_helper"

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
