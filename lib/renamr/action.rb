# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

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
