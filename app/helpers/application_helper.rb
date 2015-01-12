module ApplicationHelper
  def nav_sports_list
    return @sports = current_user.sports if defined?(current_user)
  end
end
