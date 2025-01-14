include_recipe '::dd-agent'

# Monitor activemq
#
# Assuming you have 2 clusters "test" and "prod",
# one with and one without authentication
# you need to set up the following attributes
# node['datadog']['activemq']['instances'] = [
#                                     {
#                                       :host => "localhost",
#                                       :port => "1234",
#                                       :name => "prod",
#                                       :user => "username",
#                                       :password => "secret"
#                                     },
#                                     {
#                                       :host => "localhost",
#                                       :port => "3456",
#                                       :name => "test"
#                                     }
#                                    ]

datadog_monitor 'activemq' do
  instances node['datadog']['activemq']['instances']
  logs node['datadog']['activemq']['logs']
  action :add
  notifies :restart, 'service[datadog-agent]' if node['datadog']['agent_start']
end
