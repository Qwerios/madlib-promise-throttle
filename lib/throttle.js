(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("q"));
    } else if (typeof define === "function" && define.amd) {
      return define(["q"], factory);
    }
  })(function(Q) {
    /**
    #   A promise based throttle
    #
    #   @author     mdoeswijk
    #   @module     throttle
    #   @constructor
    #   @param  {Number}    delay   The delay in milliseconds the needs be maintained between calls to connect. Defaults to 1 second.
    #   @version    0.1
    */

    return function(delay) {
      var _this = this;
      this.delay = delay || 1000;
      this.lastConnect = 0;
      return {
        /**
        #   Connect will return a promise that wont resolve unless the time between
        #   the previous call connect is longer then the delay
        #
        #   @function connect
        #
        #   @return {Promise}   Will resolve when the throttle delay has been satisfied
        #
        */

        connect: function() {
          var deferred, next, now, wait;
          deferred = Q.defer();
          now = +(new Date());
          next = _this.lastConnect + _this.delay;
          wait = next - now;
          if (next < now) {
            _this.lastConnect = now;
            deferred.resolve();
          } else {
            _this.lastConnect = next;
            setTimeout(function() {
              return deferred.resolve();
            }, wait);
          }
          return deferred.promise;
        }
      };
    };
  });

}).call(this);
