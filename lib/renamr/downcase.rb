# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2022 David Rabkin

require_relative 'action'

module Renamr
  # All names should be downcased.
  class DowncaseAction < Action
    def do(src)
      src.downcase
    end
  end
end
