module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "MoltoSoldi"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def whatType(input)
   if input == 1
     "Borrow"
   elsif input == 2
     "Lend"
   else
     "ERROR"
   end
  end
  
  def gravatar_for(user, options = { size: 50 })
       gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
       size = options[:size]
       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
       image_tag(gravatar_url, alt: user.email, class: "gravatar")
   end
  
  
end