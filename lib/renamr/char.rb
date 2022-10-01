# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 David Rabkin

require 'set'
require_relative 'action'

module Renamr
  # All special symbols besides some (., &, $) are replaced by minus.
  class CharAction < Action
    SYM = ' (){},~–\'![]_#@=„“”"`—+‘’;·‡«»%…'.chars.to_set.freeze

    def do(src)
      src.chars.map { |s| SYM.include?(s) ? '-' : s }.join
    end
  end
end
