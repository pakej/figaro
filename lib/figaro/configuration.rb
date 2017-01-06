module Figaro
    module Configuration
        mattr_accessor :ignore_warnings

        def ignore_warnings
            @ignore_warnings || false
        end
    end
end
