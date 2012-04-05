require 'tonic'

describe Tonic do
  context 'Tonic will' do

    before :all do
      system 'cd spec/dummy_git_repo'
    end

    it "" do
      Tonic.activate([]).should =~ /not in root of your repo/
    end

    after :all do
      system 'cd ...'
    end

  end
end
