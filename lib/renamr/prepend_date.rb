# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2022 David Rabkin

require_relative 'action'

module Renamr
  # Prepends file modification datestamp.
  class PrependDateAction < Action
    def initialize(dir)
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
