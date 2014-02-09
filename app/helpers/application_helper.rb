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
      current_hacker.nickname
    end
  end
end
