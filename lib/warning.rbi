# typed: strong
# frozen_string_literal: true

module Warning
  sig { params(msg: T.any(Regexp, String)).returns(T.untyped) }
  def warn(msg)
  end
end
