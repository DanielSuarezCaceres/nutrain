module ApplicationHelper
  include Pagy::Frontend

=begin
  def flash_class(level)
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
        concat content_tag(:button, "x", class: "close", data: { dismiss: "alert" })
        concat message
      end)
    end
    nil
  end
=end
end
