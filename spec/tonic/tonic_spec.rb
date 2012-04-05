require 'tonic'

module Tonic
  module GhPages
    class << self

      private

      def gh_pages(template = nil)
        are_you_in_repo?

        if branch_exists?
          abort 'You shall no pass. First you should delete gh-pages branch'
        end

        # This for run shell commands from needed directory
        # puts 'Do you really want to create gh-pages branch with tonic? [y/n]'
        # if gets.chomp =~ /y/i
          check_status
          create_branch
          remove_all_files
          create template
          commit_changes
        # end
      end

    end
  end
end

describe Tonic do
  context 'Tonic will' do

    it "do the right stuff with repo" do
      unless Dir.pwd =~ /spec\/dummy_git_repo/
        exec 'cd spec/dummy_git_repo; rspec ../../'
      else
        Tonic.activate []
        Dir.glob('*').size.should == 4
        c = Tonic::Shell.new('git status -s').run.to_s.should == ""
      end
    end

    if Dir.pwd =~ /spec\/dummy_git_repo/
      after :all do
        `git checkout master; git branch -D gh-pages`
        exec 'cd ../..'
      end
    end

  end
end
