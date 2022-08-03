module BlogsHelper
  def button_text
    if action_name == "new"
      "create"
    elsif action_name == "edit"
      "edit"
    end
  end
end
