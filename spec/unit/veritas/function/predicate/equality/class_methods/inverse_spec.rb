require 'spec_helper'

describe Function::Predicate::Equality, '.inverse' do
  subject { object.inverse }

  let(:object) { described_class }

  it { should equal(Function::Predicate::Inequality) }
end