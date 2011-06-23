module AccountsHelper
  def nested_accounts(accounts)
    accounts.map do |account, sub_accounts|
      render(account) + content_tag(:div, nested_accounts(sub_accounts), :class => "nested")
    end.join.html_safe
  end
end
