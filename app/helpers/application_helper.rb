# encoding: UTF-8
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

  def triggered_by(hacker)
    html = "ausgelöst durch "
    if hacker
    #  html << image_tag(gravatar_url_for(hacker.email, 24))
      html << hacker.nickname
    else
      html << "Anonymous"
    end
    return escape_javascript(html)#.html_safe
  end
end
