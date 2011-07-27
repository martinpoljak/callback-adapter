# encoding: utf-8
# (c) 2011 Martin Kozák (martinkozak@martinkozak.net)

##
# Adapter from an callback-based interface to standard interface.
#

class CallbackAdapter

    ##
    # Holds the proxied object.
    # @return [Object] the proxied object
    #
    
    attr_accessor :object
    @object

    ##
    # Constructor.
    # @param [Object] object  some proxied object
    #
    
    def initialize(object)
        @object = object
    end
    
    ##
    # Methods call catcher. Thread safe.
    # 
    # @param [Symbol] name name of the method
    # @param [Array] args call arguments
    # @return [Object] returned value or array of returned values
    #
    
    def method_missing(name, *args)
        returns = nil
        mutex = Mutex::new.lock

        @object.send(name, *args) do |*rets|
            case rets.length
                when 0
                    returns = nil
                when 1
                    returns = rets.first
                else
                    returns = rets
            end
            
            mutex.unlock()
        end
        
        mutex.synchronize do
            return returns
        end
    end
    
end

