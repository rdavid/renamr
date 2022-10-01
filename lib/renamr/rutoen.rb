# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2020 David Rabkin

require_relative 'action'

module Renamr
  # Transliterates Russian to English.
  class RuToEnAction < Action
    MSC = {
      'ё' => 'jo',
      'ж' => 'zh',
      'ц' => 'tz',
      'ч' => 'ch',
      'ш' => 'sh',
      'щ' => 'szh',
      'ю' => 'ju',
      'я' => 'ya',
      '$' => '-usd-',
      '№' => '-num-',
      '&' => '-and-'
    }.freeze
    SRC = 'абвгдезийклмнопрстуфхъыьэ'.chars.freeze
    DST = 'abvgdeziyklmnoprstufh y e'.chars.freeze
    DIC = SRC.zip(DST).to_h.merge(MSC).freeze

    def do(src)
      src.chars.map { |c| DIC[c].nil? ? c : DIC[c] }.collect(&:strip).join
    end
  end
end
