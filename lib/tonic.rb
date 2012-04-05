require 'tonic/gh_pages.rb'
require 'tonic/template'
require 'tonic/shell'
require 'tonic/config'

module Tonic
  class << self

    def activate(args)
      deal_with_args(args)
    end

    private

    def deal_with_args(args)
      if want_to_push?(args)
        Tonic::GhPages.push_pages
      elsif want_gh_pages?(args)
        Tonic::GhPages.activate(args[0])
      elsif want_to_create?(args)
        Tonic::Template.create args[1]
      else
        raise ArgumentError.new 'Strange argument you sent to tonic'
      end
    end

    def want_to_create?(args)
      args.size == 2 and args.first == 'new'
    end

    def want_to_push?(args)
      args[0] == 'push'
    end

    def want_gh_pages?(args)
      args.empty? or %w(middleman jekyll).include?(args[0])
    end

  end
end
