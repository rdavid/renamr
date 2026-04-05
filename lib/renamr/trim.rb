# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Collapses consecutive hyphens and trims leading/trailing hyphens.
  class TrimAction < Action
    def do(src)
      src.squeeze!('-')
      src.gsub!('-.', '.')
      src.gsub!('.-', '.')
      src.gsub!(/^-|-$/, '') unless src == '-'
      src
    end
  end
end
