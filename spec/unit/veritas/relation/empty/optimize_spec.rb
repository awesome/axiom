require File.expand_path('../../../../../spec_helper', __FILE__)

describe 'Veritas::Relation::Empty#optimize' do
  before do
    @empty = Relation::Empty.new([ [ :id, Integer ] ])
  end

  subject { @empty.optimize }

  it { should equal(@empty) }
end