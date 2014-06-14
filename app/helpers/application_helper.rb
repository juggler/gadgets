module ApplicationHelper
  def flash_messages
    messages = ''

    flash.each do |type, message|
      if %w(notice alert).include? type
        class_type = case type
          when 'notice' then 'success'
          when 'alert' then 'warning'
        end
        messages << content_tag(:div, message, class: "alert alert-#{class_type}")
      end
    end

    messages.html_safe
  end
end
