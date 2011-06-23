module UsersHelper
  def nested_users(users)
    users.map do |user, sub_users|
      render(user) + content_tag(:div, nested_users(sub_users), :class => "nested")
    end.join.html_safe
  end
end
