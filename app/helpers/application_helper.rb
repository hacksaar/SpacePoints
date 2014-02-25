module ApplicationHelper

  require 'digest/md5'
  def gravatar_url_for(email, size=48)
    hash = Digest::MD5.hexdigest(email)
    "http://gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def li_login_or_userpanel
    if current_hacker.blank?
      content_tag(:li, link_to('Einloggen', new_hacker_session_path))
    else
      concat(
        content_tag(:li, link_to(current_hacker.nickname, current_hacker))
      )

      content_tag(:li, link_to('Ausloggen', destroy_hacker_session_path, :method => :delete))
    end
  end
end
