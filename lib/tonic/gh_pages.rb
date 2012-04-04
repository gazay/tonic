module Tonic
  module GhPages
    class << self

      def activate
        gh_pages
      end

      def push_pages
        if in_gh_pages_branch?
          exec 'git push -f origin gh-pages'
        else
          puts 'Forget about it bro'
        end
      end

      private

      def in_gh_pages_branch?
        branches = sh('git branch')
        branches.lines.any? { |it| it =~ /\* gh-pages/ }
      end

      def gh_pages
        if branch_exists?
          abort 'You shall no pass. First you should delete gh-pages branch'
        end

        puts 'Do you really want to create gh-pages branch with tonic? [y/n]'
        if gets.chomp =~ /y/i
          create_branch
          remove_all_files
          Template.create
          commit_changes
        end
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

      def sh(*command)
        Tonic::Shell.run(*command)
      end

    end
  end
end
