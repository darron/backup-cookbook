# encoding: utf-8
#
# Cookbook Name:: backup
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'rsync'

bash 'create root ssh key' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    ssh-keygen -N '' -q -t dsa -f /root/.ssh/id_dsa
  EOH
  not_if { File.exists?('/root/.ssh/id_dsa') }
end

template '/usr/local/sbin/rsync.sh' do
  source 'rsync.erb'
  action :create
  user 'root'
  group 'root'
  mode '0750'
end
