module FormsHelper

  def handle_errors(subject)
    return if subject.errors.empty?
    flash.now[:alert] = raw(subject.errors.full_messages.join('<br />'))
  end

end
