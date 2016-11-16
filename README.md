## Demonstration for bug report.

### Summary

* `test_one` is a resource type
* `test_two` is a resource type that requires the `test_one` type with `require File.join(File.dirname(__FILE__),'test_one')`

When `test_two` is evaluatd first in the manifest (`testmodule::working`) things are good:

```
[root@localhost manifests]# puppet apply -e 'include testmodule::working'
Notice: Compiled catalog for localhost.localdomain in environment production in 0.10 seconds
Notice: Applied catalog in 0.02 seconds
```

When `test_one` is evaluated first in the manifest (`testmodule::broken`) Puppet throws an exception:

```
[root@localhost manifests]# puppet apply -e 'include testmodule::broken'
Error: Could not autoload puppet/type/test_two: Attempt to redefine entity 'http://puppet.com/2016.1/runtime/type/test_one'. Originally set at file:/etc/puppetlabs/code/environments/production/modules/testmodule/lib/puppet/type/test_one.rb?line=1.
Error: Evaluation Error: Error while evaluating a Resource Statement, Could not autoload puppet/type/test_two: Attempt to redefine entity 'http://puppet.com/2016.1/runtime/type/test_one'. Originally set at file:/etc/puppetlabs/code/environments/production/modules/testmodule/lib/puppet/type/test_one.rb?line=1. at /etc/puppetlabs/code/environments/production/modules/testmodule/manifests/broken.pp:7:3 on node localhost.localdomain
```

