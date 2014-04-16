( ( factory ) ->
    if typeof exports is "object"
        module.exports = factory(
            require "q"
        )
    else if typeof define is "function" and define.amd
        define( [
            "q"
        ], factory )

)( ( Q ) ->

    ###*
    #   A promise based throttle
    #
    #   @author     mdoeswijk
    #   @module     throttle
    #   @constructor
    #   @param  {Number}    delay   The delay in milliseconds the needs be maintained between calls to connect. Defaults to 1 second.
    #   @version    0.1
    ###
    ( delay ) ->
        @delay       = delay or 1000
        @lastConnect = 0

        ###*
        #   Connect will return a promise that wont resolve unless the time between
        #   the previous call connect is longer then the delay
        #
        #   @function connect
        #
        #   @return {Promise}   Will resolve when the throttle delay has been satisfied
        #
        ###
        connect: () =>
            deferred = Q.defer()

            now  = +( new Date())
            next = @lastConnect + @delay
            wait = next - now

            if next < now
                # Good to go. No need to wait
                #
                @lastConnect = now
                deferred.resolve()

            else
                # wait the required amount of time
                #
                @lastConnect = next
                setTimeout( () =>
                    deferred.resolve()
                , wait )

            # Return our promise
            #
            return deferred.promise
)