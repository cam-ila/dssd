module ApplicationHelper
  def li_login
    if user_signed_in?
      content_tag(:li, class: 'nav-item') do
        link_to('Logout', destroy_user_session_path, method: :delete, class: 'btn btn-outline-secondary my-2 my-sm-0')
      end
    else
      capture do
        content_tag(:li, class: 'nav-item') do
         concat  link_to('register', new_user_registration_path, class: 'btn btn-outline-secondary my-2 my-sm-0')
        end +
        content_tag(:li, class: 'nav-item') do
         concat  link_to('Login', new_user_session_path, class: 'btn btn-outline-secondary my-2 my-sm-0')
        end
      end
    end
  end
end

