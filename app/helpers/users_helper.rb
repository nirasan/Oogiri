module UsersHelper
  def user_tab(action, text, path)
    if current_page?(controller: 'users', action: action) then
      content_tag(:li, text, class: [:active, "text-center"])
    else
      content_tag(:li) do
        link_to(text, path)
      end
    end
  end
end
