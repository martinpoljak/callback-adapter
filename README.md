Callback Adapter
================

**callback-adapter** adapts a callback backed interface to an standard 
one, so allows safe thread-synchronized usage of evented or 
multithreaded libraries like [EventMachine][8] in standard applications 
without necessary paradigm shift. 

Some trivial example:

    require "callback-adapter"
    
    class Foo
        def bar(arg, &callback)
            callback.call(arg)
        end
    end
    
    obj = CallbackAdapter::new(Foo::new)
    obj.bar("Some argument!")   # will return the "Some argument!" string back again

In case, more return values are given to callback, returns an array
of them. Internally, it's thread synchronized, so safe.

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][9] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 [Martin Kozák][10]. See `LICENSE.txt` for
further details.

[8]: http://rubyeventmachine.com/
[9]: http://github.com/martinkozak/callback-adapter/issues
[10]: http://www.martinkozak.net/
