Callback Adapter
================

**callback-adapter** adapts a callback backed interface to an standard
one, so allows safe thread-synchronized usage of evented or
multithreaded libraries like [EventMachine][8] in standard applications
without necessary paradigm shift.

Some trivial example:

```ruby
require "callback-adapter"

class Foo
    def bar(arg, &callback)
        callback.call(arg)
    end
end

obj = CallbackAdapter::new(Foo::new)
obj.bar("Some argument!")
# will return the "Some argument!" string back again
```

In case, more return values are given to callback, returns an array
of them. Internally, it's thread synchronized, so safe.

Copyright
---------

Copyright &copy; 2011 &ndash; 2015 [Martin Poljak][10]. See `LICENSE.txt` for
further details.

[8]: http://rubyeventmachine.com/
[9]: http://github.com/martinkozak/callback-adapter/issues
[10]: http://www.martinkozak.net/
