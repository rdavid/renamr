# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
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
