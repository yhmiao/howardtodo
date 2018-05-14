module TodosHelper
  def date_time_display(datetime, action=nil)
    options = { "data-badge-caption" => datetime.strftime("%Y/%m/%d at %I:%M%p") }

    case(action)
    when 'create'
      options[:class] = "new badge light-green darken-1" 
    when 'update'
      options[:class] = "new badge light-blue darken-1"
    else
      options[:class] = "badge"
    end

    content_tag(:span, nil, options)
  end
end
