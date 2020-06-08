# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-present David Rabkin

module Renamr
  # An interface for actions implementation.
  class Action
    def do(src)
      raise "Undefined method Action.do is called with #{src}."
    end

    def set(src) end

    def p2m(src)
      src.tr('.', '-')
    end
  end
end
