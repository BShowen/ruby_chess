class CallStack
    def initialize
        @stack = []
    end

    def stack
        @stack
    end
    
    def pop
        @stack.shift
    end
    
    def push(data)
        @stack.unshift(data)
    end
end