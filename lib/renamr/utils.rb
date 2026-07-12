# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'ellipsized'

# Provides utility methods.
class Utils
  class << self
    def trim(src, lim)
      src.ellipsized(lim, '~', :center)
    end
  end
end
