# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Prepends file modification datestamp.
  class PrependDateAction < Action
    def initialize(dir)
      super()
      @dir = dir
    end

    def do(src)
      src.prepend(File.mtime(File.join(@dir, @src)).strftime('%Y%m%d-'))
    end

    def set(src)
      @src = src
    end
  end
end
