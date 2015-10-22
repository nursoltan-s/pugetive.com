module IconHelper
  def delete_icon
    foundation_icon('x-circle')
  end

  def new_icon
    foundation_icon('torso')
  end


  private

    def foundation_icon(token, options = {})
      content_tag(:i, nil, class: ['icon', "fi-#{token}"])
    end


end
