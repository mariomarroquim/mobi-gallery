# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def flashes
    output = ""
    [:alert, :success].each do |type|
      next if flash[type].blank?
      output += "<h3 class='#{type} message'>#{flash[type]}</h3>"
      flash[type] = nil
    end

    output
  end

end
