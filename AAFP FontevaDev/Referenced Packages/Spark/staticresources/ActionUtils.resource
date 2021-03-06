(function(root, factory) {

    if (typeof define === 'function' && define.amd) {
        define(factory);
    } else if (typeof exports === 'object') {
        module.exports = factory();
    } else {
        root.ActionUtils = factory();
    }

}(this, function() {
    'use strict';

    //utility class to wrap calls with $A.getCallback
    function AuraPromise(executor) {
        this.innerPromise = new Promise(executor);
    }

    AuraPromise.prototype.catch = function (onError) {
        this.innerPromise = this.innerPromise.catch($A.getCallback(onError));
        return this;
    };

    AuraPromise.prototype.finally = function (onFinally) {
        this.innerPromise = this.innerPromise.finally($A.getCallback(onFinally));
        return this;
    };

    AuraPromise.prototype.then = function (resolve, reject) {
        this.innerPromise = this.innerPromise.then(resolve ? $A.getCallback(resolve) : null, reject ? $A.getCallback(reject) : null);
        return this;
    };

    return {
        executeAction: function (self, cmp, action, params, forceBase) {
            params = params || {};
            //check cookie or whatever to see if caching enabled
            var useCanned = sessionStorage.getItem('mock');
            var scenario = sessionStorage.getItem('scenario');
            if (scenario === 'false' || scenario == null) scenario = false; //sessionStorage returns Strings
            if (useCanned) {
                return new AuraPromise(function (resolve, reject) {
                    var xhr = new XMLHttpRequest();

                    var onload = $A.getCallback(function (oEvent) {
                        if (parseInt(xhr.status / 100) === 2 || xhr.response === 304) {
                            return resolve(JSON.parse(xhr.response));
                        }
                        else if (scenario || !forceBase) { //scenario failed. Recurse w/ base case
                            return ActionUtils.executeAction(self, cmp, action, params, true).then(resolve, reject);
                        }
                        else { //All mock data failed. Call the server action.
                            return ActionUtils._executeAction(self, cmp, action, params).then(resolve, reject);
                        }
                    });

                    if (scenario && !forceBase) {
                        scenario = '.' + scenario;
                    }
                    else {
                        scenario = '';
                    }
                    xhr.open("GET", "https://fonteva.github.io/mockData/2018-R2/" + action.substring(2) + scenario + ".json?cachebuster=" + Date.now());
                    xhr.onload = onload;
                    xhr.send();
                });
            }

            //otherwise delegate to action utils
            return ActionUtils._executeAction(self, cmp, action, params);
        },
        _executeAction : function(self,cmp,actionName,params) {
            //caching!!
            var debug = sessionStorage.getItem('fon.log');
            var verbose = debug === "debug";

            var cacheKey = params.cacheKey;
            var invalidateKey = params.invalidateKey;
            delete params.cacheKey;
            delete params.invalidateKey;

            if (invalidateKey) {
                if (verbose) console.log('Invalidating cacheKey: ' + invalidateKey);
                sessionStorage.removeItem(invalidateKey);
            }

            if (cacheKey && sessionStorage.getItem(cacheKey)) {
                if (debug) console.groupCollapsed(actionName + " <" + cmp.getName() + "/> cache hit");
                if (verbose) console.log(JSON.stringify(sessionStorage.getItem(cacheKey), null, "  "));
                if (debug) console.groupEnd();
                return new AuraPromise(function (resolve) {
                    resolve(JSON.parse(sessionStorage.getItem(cacheKey)));
                })
            }

            //test to see if we're in pure mock mode and the code hasn't been written
            //and fail gracefully if we are. This means we will run .catch() and .finally() blocks
            //old code was just throwing
            var action;
            try {
                action = cmp.get(actionName);
            }
            catch (error) {
                return new AuraPromise(function (resolve, reject) {
                    reject(error);
                });
            }

            action.setParams(params);
            var trace = Error().stack;
            return new AuraPromise(function (resolve, reject) {
                action.setCallback(this, function (response) {
                    var state = response.getState();
                    if (state === "SUCCESS") {
                        if (debug) console.groupCollapsed(actionName + " <" + cmp.getName() + "/>");

                        if (verbose) console.groupCollapsed("stack trace");
                        if (verbose) console.log(trace);
                        if (verbose) console.groupEnd();

                        if (verbose) console.groupCollapsed("action parameters");
                        if (verbose) console.log(JSON.stringify(params, null, "  "));
                        if (verbose) console.groupEnd();

                        var retVal = response.getReturnValue();

                        if (verbose) console.groupCollapsed("return value");
                        if (verbose) console.log(JSON.stringify(retVal, null, "  "));
                        if (verbose) console.groupEnd();

                        if (cacheKey) {
                            if (verbose) console.log("Caching value as '" + cacheKey + "'");
                            sessionStorage.setItem(cacheKey, JSON.stringify(retVal));
                        }

                        if (debug) console.groupEnd();
                        resolve(retVal);
                    }
                    else if (state === "ERROR") {
                        if (debug) console.groupCollapsed(actionName + " <" + cmp.getName() + "/> Failed!");

                        var errors = response.getError();
                        var errMsg = '';
                        if (errors[0] && errors[0].message) {
                            errMsg = errors[0].message;
                            ActionUtils.showErrorMessage(cmp, errors[0].message);
                        }
                        reject("Error calling `" + actionName + "`: " + errMsg);

                        console.log("Error calling `" + actionName + "`: " + errMsg);

                        if (verbose) console.groupCollapsed("action parameters");
                        if (verbose) console.log(JSON.stringify(params, null, "  "));
                        if (verbose) console.groupEnd();

                        if (debug) console.groupEnd();
                    }
                    else {
                        reject("Unknown error calling `" + actionName + "`");
                        console.log("Unknown error calling `" + actionName + "`");
                    }
                });
                $A.enqueueAction(action);
            });
        },
        // executeStorableAction : function(self,cmp, action,params,callback) {
        //     var action = cmp.get(action);
        //     action.setParams(params);
        //     action.setCallback(this, function(response) {
        //         var state = response.getState();
        //         if (state === "SUCCESS") {
        //             var retVal = response.getReturnValue();
        //             resolve(retVal);
        //         }
        //         else if (state === "ERROR") {
        //             var errors = response.getError();
        //             if (errors) {
        //                 if (errors[0] && errors[0].message) {
        //                     this.showErrorMessage(cmp,errors[0].message);
        //                     reject(Error("Error message: " + errors[0].message));
        //                 }
        //             }
        //             else {
        //                 reject(Error("Unknown error"));
        //             }
        //         }
        //     });
        //     action.setStorable();
        //     $A.enqueueAction(action);
        // },
        showErrorMessage: function (cmp, message, sysLog) {
            var type = 'error';
            var title = 'Unexpected Error';
            if (sysLog) {
                title = 'System Error Log: ' + sysLog.Name;
            }

            var toastEvent = $A.get("e.force:showToast");
            if (toastEvent) {
                toastEvent.setParams({
                    title: title,
                    message: message,
                    type: type
                });
                toastEvent.fire();
            }
            else if (cmp.find('toastMessages')) {
                cmp.find('toastMessages').showMessage(title, message, false, type);
            }
            else {
                console.log(title,message);
            }
        },
        generateId : function (len) {
            var text = "";
            var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

            for( var i=0; i < len; i++ ) {
                text += possible.charAt(Math.floor(Math.random() * possible.length));
            }

            return text;
        }
    }
}));
