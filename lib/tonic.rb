require 'tonic/template'

module Tonic
  class << self

    def activate(*args)
      raise "I told you - it's not working yet. Bear a little patience"
      if args.empty?
        gh_pages
      elsif args.first == 'template'
        generate_template
      elsif args.first == 'push'
        push_pages
      end
    end

    def gh_pages
      if branch_exists?
        raise 'You shall no pass. First you should delete gh-pages branch'
      end

      create_branch
      remove_all_files
      copy_template
      commit_changes
    end

    def push_pages
      raise "I told you - it's not working yet. Bear a little patience"
      if in_gh_pages_branch?
        sh 'git push -f origin gh-pages'
      else
        puts 'Forget about it bro'
      end
    end

    def generate_template
      Tonic::Template.activate
    end

    private

    def in_gh_pages_branch?
      branches = sh('git branch')
      branches.lines.any? { |it| it =~ /\* gh-pages/ }
    end

    def branch_exists?
      branches = sh('git branch')
      branches.lines.any? { |it| it =~ /gh-pages/ }
    end

    # TODO: Later I will think about how to do it through github-gem properly
    def create_branch
      sh 'git branch gh-pages'
      sh 'git checkout gh-pages'
    end

    def remove_all_files
      sh 'rm -rf ./*'
    end

    def commit_changes
      sh "git add ."
      sh "git commit -am 'Init github pages'"
    end

    def copy_template
      path =  File.expand_path('../../template', __FILE__)
      puts path
      sh "cp -r #{path}/* ./"
    end

    def sh(*command)
      Tonic::Shell.run(*command)
    end

  end
end
