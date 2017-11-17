module ApplicationHelper
  def li_login
    if user_signed_in?
      content_tag(:li, class: 'nav-item') do
        link_to('Logout', destroy_user_session_path, method: :delete, class: 'nav-link')
      end
    else
      capture do
        content_tag(:li, class: 'nav-item') do
         concat  link_to('Register', new_user_registration_path, class: 'nav-link')
        end +
        content_tag(:li, class: 'nav-item') do
         concat  link_to('Login', new_user_session_path, class: 'nav-link')
        end
      end
    end
  end
end
