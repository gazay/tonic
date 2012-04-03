require 'tonic'

describe Tonic, '#not_working' do
  it 'really not working yet' do
    Tonic::VERSION.should == '0.0.2'
  end
end

raise 'Build is not ok'
