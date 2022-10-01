# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 by David Rabkin

require 'i18n'
require_relative 'action'

module Renamr
  # Automatic localization.
  class AutoLocalizationAction < Action
    def initialize
      I18n.config.available_locales = :en
    end

    def do(src)
      I18n.transliterate(src).tr('?', '')
    end
  end
end
