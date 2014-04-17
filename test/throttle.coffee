chai     = require "chai"
Throttle = require "../lib/throttle.js"

throttle = new Throttle( 1000 )
now      = +( new Date() )

describe( "throttle", () ->
    describe( "#connect(1)", () ->
        it( "Should be immediate", ( testCompleted ) ->

            throttle.connect()
            .then(
                ( data ) ->
                    completed = +( new Date() )
                    delay     = completed - now

                    chai.expect( delay ).to.be.below( 500 )
                    testCompleted();
            )
            .done()
        )
    )

    describe( "#connect(2)", () ->
        it( "Should be delayed", ( testCompleted ) ->

            throttle.connect()
            .then(
                ( data ) ->
                    completed = +( new Date() )
                    delay     = completed - now

                    chai.expect( delay ).to.be.above( 1000 )
                    testCompleted();
            )
            .done()
        )
    )
)