# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

module Renamr
  # Interface for action implementations.
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
