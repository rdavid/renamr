# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# SPDX-FileCopyrightText: 2018-2026 David Rabkin
# SPDX-License-Identifier: 0BSD

require_relative 'action'

module Renamr
  # Manual transliteration map.
  class ManualLocalizationAction < Action
    SRC = 'ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđ' \
          'ÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏ' \
          'ìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅ' \
          'ņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝ' \
          'ŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝ' \
          'ýÿŶŷŸŹźŻżŽž'
    DST = 'AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDd' \
          'EEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIII' \
          'iiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnN' \
          'nNnnNnOOOOOOooooooOoOoOoRrRrRrSsSs' \
          'SsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwY' \
          'yyYyYZzZzZz'

    def do(src)
      src.tr(SRC, DST)
    end
  end
end
