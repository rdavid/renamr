# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2025 David Rabkin
# SPDX-License-Identifier: 0BSD

require 'i18n'
require_relative 'action'

module Renamr
  # Automatic localization.
  class AutoLocalizationAction < Action
    def initialize
      super()
      I18n.config.available_locales = :en
    end

    def do(src)
      I18n.transliterate(src).tr('?', '')
    end
  end
end
