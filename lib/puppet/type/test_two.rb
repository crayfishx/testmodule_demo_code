require File.join(File.dirname(__FILE__),'test_one')

Puppet::Type.newtype(:test_two) do

newparam(:name, :namevar => true)
end
