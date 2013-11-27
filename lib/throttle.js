(function() {
  (function(factory) {
    if (typeof exports === "object") {
      return module.exports = factory(require("q"));
    } else if (typeof define === "function" && define.amd) {
      return define(["q"], factory);
    }
  })(function(Q) {
    return function(delay) {
      var _this = this;
      this.delay = delay || 1000;
      this.lastConnect = 0;
      return {
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
