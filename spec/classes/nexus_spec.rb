require 'spec_helper'

describe 'nexus' do
  let(:facts) do
    {
      os: { architecture: 'x86_64', family: 'RedHat', hardware: 'x86_64', release: { full: '7.5', major: '7', minor: '5' } },
    }
  end

  it { is_expected.to compile.with_all_deps }
end
