# Implementation of sh from github-gem
# https://github.com/defunkt/github-gem

module Tonic
  class Shell < String

    attr_reader :error
    attr_reader :out

    def self.run(*command)
      self.new(*command).run
    end

    def initialize(*command)
      @command = command
    end

    def run
      out = err = nil
      Open3.popen3(*@command) do |_, pout, perr|
        out = pout.read.strip
        err = perr.read.strip
      end

      replace @error = err unless err.empty?
      replace @out = out unless out.empty?

      self
    end

    def command
      @command.join(' ')
    end

    def error?
      !!@error
    end

    def out?
      !!@out
    end

  end
end
