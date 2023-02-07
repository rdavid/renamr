# frozen_string_literal: true

# vi:ts=2 sw=2 tw=79 et lbr wrap
# Copyright 2018-2022 David Rabkin

require_relative 'ascii_validator'
require_relative 'auto_localization'
require_relative 'char'
require_relative 'date'
require_relative 'downcase'
require_relative 'manual_localization'
require_relative 'omit'
require_relative 'point'
require_relative 'prepend'
require_relative 'prepend_date'
require_relative 'remove'
require_relative 'rutoen'
require_relative 'substitute'
require_relative 'trim'
require_relative 'truncate'

module Renamr
  # Produces actions for certain directories.
  class ActionsFactory
    LIMIT = 143 # Synology eCryptfs limitation.

    def initialize(cfg)
      @cfg = cfg
    end

    def produce(dir) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
      if @cfg.lim?
        [
          OmitAction.new(LIMIT),
          TruncateAction.new(LIMIT)
        ]
      else
        [
          PointAction.new(dir), # Should be the first.
          @cfg.pos.nil? ? nil : RemoveAction.new(@cfg.pos, @cfg.len),
          @cfg.src.nil? ? nil : SubstituteAction.new(@cfg.src, @cfg.dst),
          ManualLocalizationAction.new,
          DowncaseAction.new,
          CharAction.new,
          RuToEnAction.new,
          AutoLocalizationAction.new,
          @cfg.mod? ? PrependDateAction.new(dir) : nil,
          @cfg.pre.nil? ? nil : PrependAction.new(@cfg.beg, @cfg.pre),
          ASCIIValidatorAction.new,
          TrimAction.new,
          TruncateAction.new(LIMIT),
          DateAction.new
        ].compact
      end
    end
  end
end
