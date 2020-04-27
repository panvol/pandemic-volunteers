# frozen_string_literal: true

module ApplicationHelper
  def notie_flash_class(type)
    case type
    when 'notice'
      'success'
    when 'alert'
      'error'
    else
      'info'
    end
  end
end
