require 'rubygems'
require 'crack'
require 'open-uri'

URL = 'http://www.recovery.gov/arra/pages/GetXmlData.aspx?data=recipientHomeMap'

Crack::XML.parse(open(URL).read)['map']['view']['totals']['state'].each do |state|
  puts ['id', 'awarded', 'received', 'jobs'].map{|f| state[f]}.join(', ')
end