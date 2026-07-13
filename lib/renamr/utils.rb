# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'ellipsized'
require 'unicode/display_width'

# Provides utility methods.
class Utils
  class << self
    # Trims src to fit lim terminal columns. Wide characters such as CJK
    # occupy two columns, so the string keeps shrinking until its display
    # width fits the limit.
    def trim(src, lim)
      out = src.ellipsized(lim, '~', :center)
      while out.length > 1 && Unicode::DisplayWidth.of(out) > lim
        out = out.ellipsized(out.length - 1, '~', :center)
      end
      out
    end
  end
end
