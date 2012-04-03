require 'tonic/template'

module Tonic
  class << self

    def activate(*args)
      raise "I told you - it's not working yet. Bear a little patience"
      if args.empty?
        Tonic::GhPages.activate
      elsif args.first == 'template'
        Tonic::Template.activate
      elsif args.first == 'push'
        Tonic::GhPages.push_pages
      end
    end

  end
end
