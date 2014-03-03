# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'backup::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs rsync' do
    expect(chef_run).to install_package('rsync')
  end

  it 'creates a the rsync script' do
    expect(chef_run).to create_template('/etc/cron.daily/rsync-backup')
  end
end
