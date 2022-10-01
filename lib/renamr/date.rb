# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2020 David Rabkin

require 'date'
require_relative 'action'

module Renamr
  # Replaces any valid date, e.g. 2020-11-02 or 02-11-2020 with 20201102.
  class DateAction < Action
    REG = /(\d+)-(\d+)-(\d+)/.freeze
    PAT = ['%m-%d-%Y', '%d-%m-%Y', '%Y-%m-%d', '%Y-%d-%m'].freeze

    def validate(dat)
      return nil if dat < Date.new(1900, 1, 1)

      return nil if dat > Date.new(2099, 1, 1)

      dat
    end

    def date(sub)
      PAT.each do |pat|
        return Date.strptime(sub, pat)
      rescue ArgumentError
        # Nothing to do.
      end
      nil
    end

    def do(src)
      sub = src[REG]
      return src if sub.nil?

      dat = date(sub)
      return src if dat.nil?

      dat = validate(dat)
      return src if dat.nil?

      src.sub!(REG, dat.strftime('%Y%m%d'))
    end
  end
end
