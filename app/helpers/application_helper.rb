module ApplicationHelper

  require 'digest/md5'
  def gravatar_url_for(email, size=48)
    hash = Digest::MD5.hexdigest(email)
    "http://gravatar.com/avatar/#{hash}?s=#{size}"
  end

  def login_or_username
    if current_hacker.blank?
      link_to 'Einloggen', new_hacker_session_path 
    else
      link_to current_hacker.nickname, current_hacker
    end
  end
end
