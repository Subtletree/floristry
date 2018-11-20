require 'flor'
require 'jsonclient'

require 'floristry/configuration'
require 'floristry/engine'
require 'floristry/workflow_engine'

require 'forwardable'
require 'active_attr'
require 'active_model'
require 'active_model/mass_assignment_security'

module Floristry

  NO_SUBID = 'empty_subid' # Replacement for the subid part of a FEID.

  module ExpressionMixin

    attr_accessor :era

    def is_past?()    @era == :past    end
    def is_present?() @era == :present end
    def is_future?()  @era == :future  end

    def inactive?()   @era != :present end
    alias_method :disabled?, :inactive?
    alias_method :active?, :is_present?

    def layout() false end

    def to_partial_path()

      @_to_partial_path ||= begin
        p = self.class.name.split('::').drop(1)
        "#{p.map(&:underscore).join('/')}".freeze
      end
    end
  end

  # BranchExpression isn't complete as it requires forwardable for def_delegate
  # and ultimately, @children.
  #
  module BranchExpressionMixin

    def is_leaf?() false end
    def is_branch?() true end
    def is_participant?() false end
  end

  module LeafExpressionMixin

    include ExpressionMixin

    def is_leaf?() true end
    def is_branch?() false end
    def is_participant?() false end
    def instance() self end
    def current_state() 'in_progress' end
    def layout() 'layouts/floristry/leaf-expression' end
  end

  module ParticipantExpressionMixin

    def is_participant?() true end
    def due_at() nil end
    def instance() self end

    def current_state

      case era
        when :future
          'upcoming'
        when :present
          'open'
        when :past
          'closed'
        else
          ''
      end
    end
  end
end