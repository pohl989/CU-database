module ApplicationHelper

  def boolean_helper(boolean)
    t = boolean ? 'fa fa-check text-success' : 'fa fa-ban text-danger'
    content_tag(:i, "", class: t)
  end

end
