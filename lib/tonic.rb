require 'tonic/template'

module Tonic
  class << self

    def activate(*args)
      raise "I told you - it's not working yet. Bear a little patience"
      deal_with_args(*args)
    end

    private

    def deal_with_args(*args)
      if args.empty?
        Tonic::GhPages.activate
      elsif want_to_create?(args)
        Tonic::Template.create args[1]
      elsif want_to_push?(args)
        Tonic::GhPages.push_pages
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

  end
end
