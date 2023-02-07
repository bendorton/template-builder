module NavigationHelper
  def authentication_header_partial_path
    if user_signed_in?
      'layouts/navigation/collapsible_elements/signed_in_nav'
    else
      'layouts/navigation/collapsible_elements/signed_out_nav'
    end
  end
end
