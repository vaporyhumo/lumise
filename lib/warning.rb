# typed: true
# frozen_string_literal: true

module Warning
  def warn(msg)
    unless 'keyword parameters'.match?(msg)
      msg
    end
  end
end
