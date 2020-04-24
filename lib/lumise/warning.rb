# typed: false
# frozen_string_literal: true

module Warning
  def warn(msg)
    msg unless 'keyword parameters'.match?(msg)
  end
end
