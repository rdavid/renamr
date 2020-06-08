# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-present David Rabkin

require_relative 'action'

module Renamr
  # Manual localization.
  class ManualLocalizationAction < Action
    SRC = 'ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđ'\
          'ÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħÌÍÎÏ'\
          'ìíîïĨĩĪīĬĭĮįİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñŃńŅ'\
          'ņŇňŉŊŋÒÓÔÕÖØòóôõöøŌōŎŏŐőŔŕŖŗŘřŚśŜŝ'\
          'ŞşŠšſŢţŤťŦŧÙÚÛÜùúûüŨũŪūŬŭŮůŰűŲųŴŵÝ'\
          'ýÿŶŷŸŹźŻżŽž'
    DST = 'AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDd'\
          'EEEEeeeeEeEeEeEeEeGgGgGgGgHhHhIIII'\
          'iiiiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnN'\
          'nNnnNnOOOOOOooooooOoOoOoRrRrRrSsSs'\
          'SsSssTtTtTtUUUUuuuuUuUuUuUuUuUuWwY'\
          'yyYyYZzZzZz'

    def do(src)
      src.tr(SRC, DST)
    end
  end
end
