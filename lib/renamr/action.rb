# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

module Renamr
  # Defines the interface for action implementations.
  class Action
    # Transforms a file name and returns it, or nil to skip the file.
    # Subclasses must override this method.
    def do(src)
      raise "Subclasses must override Action#do, called with #{src}."
    end

    # Receives the original file name before the pipeline runs. Does nothing
    # by default.
    def set(src) end

    # Replaces dots with hyphens.
    def p2m(src)
      src.tr('.', '-')
    end
  end
end
