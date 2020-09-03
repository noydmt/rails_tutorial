module ApplicationHelper

  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      # railsはRubyのメソッドを使用できる
      base_title
    else
      page_title + "|" + base_title
    end 
  end

end
