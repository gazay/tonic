require 'tonic'

describe Tonic do
  context 'Tonic will' do

    context "create gh-pages and" do

      before :all do
        unless Dir.pwd =~ /spec\/dummy_git_repo/
          command = <<EOF
            cd spec/dummy_git_repo;\
            git init;\
            git add .;\
            git commit -am 'init commit';\
            rspec ../../
EOF
          exec command
        end
      end

      it "copy there tonic-template" do
        Tonic.activate []

        Tonic::Shell.new('git branch').run.to_s.should =~ /\* gh-pages/

        Dir.glob('*').should == %w(assets Gemfile Gemfile.lock Rakefile)

        Tonic::Shell.new('git status -s').run.to_s.should == ""
      end

      it "copy there middleman template" do
        Tonic.activate ['middleman']

        Tonic::Shell.new('git branch').run.to_s.should =~ /\* gh-pages/

        Dir.glob('*').should == %w(config.rb source)

        Tonic::Shell.new('git status -s').run.to_s.should == ""
      end

      after :each do
        if Dir.pwd =~ /spec\/dummy_git_repo/
          `git checkout master; git branch -D gh-pages`
        end
      end

      after :all do
        if Dir.pwd =~ /spec\/dummy_git_repo/
          `rm -rf .git`
          exec 'cd ../..'
        end
      end

    end

  end
end
