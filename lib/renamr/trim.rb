# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 by David Rabkin

require_relative 'action'

module Renamr
  # Replaces multiple minuses to single. Trims minuses.
  class TrimAction < Action
    def do(src)
      src.gsub!(/-+/, '-')
      src.gsub!('-.', '.')
      src.gsub!('.-', '.')
      src.gsub!(/^-|-$/, '') unless src == '-'
      src
    end
  end
end
