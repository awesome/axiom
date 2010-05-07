require File.expand_path('../../../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe 'Veritas::Logic::Connective#inspect' do
  subject { connective.inspect }

  let(:connective) { ConnectiveSpecs::Object.new }

  specify { method(:subject).should raise_error(NotImplementedError, 'ConnectiveSpecs::Object#inspect must be implemented') }
end