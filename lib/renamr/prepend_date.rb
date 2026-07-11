# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Prepends the file modification date.
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
