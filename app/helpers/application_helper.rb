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
  
end