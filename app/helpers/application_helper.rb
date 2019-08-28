module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'POPAI SEKINE'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def print_validation_errors(object)
    content_tag(:ul, '') do
      object.errors.full_messages.map { |message| content_tag(:li, message) }.join.html_safe
    end
  end
end
