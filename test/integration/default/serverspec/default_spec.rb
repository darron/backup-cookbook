# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'backup::default' do
  describe package('rsync') do
    it { should be_installed }
  end

  describe file('/root/.ssh/id_dsa') do
    it { should be_file }
  end
end
