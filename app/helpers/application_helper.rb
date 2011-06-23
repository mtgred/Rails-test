module ApplicationHelper
  def nested(elements)
    elements.map do |element, sub_elements|
      render(element) + content_tag(:div, nested(sub_elements), :class => "nested")
    end.join.html_safe
  end
end
