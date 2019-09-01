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

  def print_messages
    messages = []

    if flash[:notice]
      messages << content_tag(:div, '', class: 'flash') do
        content_tag(:p, flash[:notice], class: 'notice')
      end
    end

    if flash[:alert]
      messages << content_tag(:div, '', class: 'flash') do
        content_tag(:p, flash[:alert], class: 'alert')
      end
    end

    messages.join.html_safe
  end
end
