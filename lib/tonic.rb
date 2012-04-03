require 'github'

module Tonic
  class << self

    def activate
      if branch_exists?
        raise 'You shall no pass. First you should delete gh-pages branch'
      end

      create_branch
      remove_all_files
      copy_template
    end

    private

    def branch_exists?
      branches = command.git 'branch'
      branches.any? { |it| it =~ /gh-pages/ }
    end

    # TODO: Later I will think about how to do it through github-gem properly
    def create_branch
      sh 'git branch gh-pages'
      sh 'git checkout gh-pages'
    end

    def remove_all_files
      sh 'rm -rf ./*'
    end

    def copy_template
      path =  File.expand_path('../template', __FILE__)
      puts path
      sh "cp #{path}/* ./"
    end

    def sh(*command)
      GitHub::Command::Shell.new(*command).run
    end

  end
end
