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

    ( delay ) ->
        @delay       = delay or 1000
        @lastConnect = 0

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