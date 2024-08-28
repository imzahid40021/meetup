module GroupsHelper
  def group_oraganizers(group)
    group.users.organizers(group).pluck(:first_name).join(', ')
  end
end