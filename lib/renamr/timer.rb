# frozen_string_literal: true

# vi: et lbr sw=2 ts=2 tw=79 wrap
# SPDX-FileCopyrightText: 2026 David Rabkin
# SPDX-License-Identifier: 0BSD

# Measures elapsed time and reports it in a human-readable form.
class Timer
  DIC = [
    [60,   :seconds, :second],
    [60,   :minutes, :minute],
    [24,   :hours,   :hour],
    [1000, :days,    :day]
  ].freeze

  def initialize
    @sta = Time.now
  end

  # Returns the time elapsed since creation as human-readable text.
  def read
    humanize(Time.now - @sta)
  end

  # Converts seconds to text such as 1 hour 1 minute 1 second.
  def humanize(sec)
    return 'less than a second' if sec < 1

    DIC.filter_map do |cnt, nms, nm1|
      next if sec <= 0

      sec, n = sec.divmod(cnt)
      next if n.to_i.zero?

      "#{n.to_i} #{n.to_i == 1 ? nm1 : nms}"
    end.reverse.join(' ')
  end
end
