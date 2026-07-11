# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

module Renamr
  # Defines the interface for action implementations.
  class Action
    def do(src)
      raise "Action.do must be overridden, called with #{src}."
    end

    def set(src) end

    def p2m(src)
      src.tr('.', '-')
    end
  end
end
