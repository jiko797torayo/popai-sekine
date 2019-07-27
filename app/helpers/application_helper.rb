module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'POPAI SEKINE'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def print_messages
    messages = []

    messages << content_tag(:p, flash[:notice]) if flash[:notice]

    messages << content_tag(:p, flash[:alert], class: 'red') if flash[:alert]

    messages.join.html_safe
  end

  def print_validation_errors(object)
    content_tag(:ul, '', class: 'red error-text') do
      object.errors.full_messages.map { |message| content_tag(:li, message) }.join.html_safe
    end
  end
end
