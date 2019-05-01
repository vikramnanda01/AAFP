(function(root, factory) {

    if (typeof define === 'function' && define.amd) {
        define(factory);
    } else if (typeof exports === 'object') {
        module.exports = factory();
    } else {
        root.FH = root.FontevaHelper = factory();

        function AuraPromise(executor) {
            if (executor) {
                this.innerPromise = new Promise(executor);
            }
        }

        AuraPromise.all = function(promises) {
            var auraPromise = new AuraPromise();
            auraPromise.innerPromise = Promise.all(promises);
            return auraPromise;
        };

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
        root.AuraPromise = AuraPromise;
    }

}(this, function() {
    return {
        cachePrefix: 'fonteva',
        showToastFor : 'fonteva',
        notEmpty: function(value) {
            return !$A.util.isEmpty(value);
        },
        getCookie: function(cname) {
            var name = cname + "=";
            var ca = document.cookie.split(';');
            for (var i = 0; i < ca.length; i++) {
                var c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        },
        setCookie : function(cname,value,days) {
            var expires = '';
            if (days) {
                var date = new Date();
                date.setTime(date.getTime()+(days*24*60*60*1000));
                expires = "; expires="+date.toGMTString();
            }
            document.cookie = cname+"="+value+expires+"; path=/;secure";
        },
        cacheItem: function(key, value, ttl) {
            if ($A.util.isEmpty(ttl)) {
                ttl = 100000;
            }
            sessionStorage.setItem(this.cachePrefix + '.' + key, JSON.stringify({
                cachedObj: value,
                insertDate: new Date(),
                ttl: ttl
            }));
        },
        clearCacheItem: function(key) {
            sessionStorage.removeItem(this.cachePrefix + '.' + key);
        },
        getCacheItem: function(key) {
            var cachedObj = sessionStorage.getItem(this.cachePrefix + '.' + key);
            if (!$A.util.isEmpty(cachedObj)) {
                cachedObj = JSON.parse(cachedObj);
            }
            if (!$A.util.isEmpty(cachedObj) && (new Date() - Date.parse(cachedObj.insertDate)) < cachedObj.ttl) {
                return cachedObj.cachedObj;
            } else {
                this.clearCacheItem(key);
            }
            return null;
        },
        flushExpired: function() {
            for (var key in sessionStorage) {
                if (key.indexOf(this.cachePrefix) > -1 && (new Date() - Date.parse(cachedObj.insertDate)) > cachedObj.ttl) {
                    sessionStorage.removeItem(key);
                }
            }
        },
        flushAll: function() {
            for (var key in sessionStorage) {
                if (key.indexOf(this.cachePrefix) > -1) {
                    sessionStorage.removeItem(key);
                }
            }
        },
        getHashParam: function() {
            var sPageURL = decodeURIComponent(window.location.search.substring(1));
            sHashVariable = sPageURL.split('#');
            if (sHashVariable.length > 1) {
                return sHashVariable[1];
            }
        },
        getUrlParameter: function(paramName) {
            var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                sURLVariables = sPageURL.split('#')[0].split('&'),
                sParameterName,
                i;
            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === paramName) {
                    return sParameterName[1] === undefined ? true : sParameterName[1];
                }
            }
        },
        getUrlVars : function() {
            var vars = {}, hash;
            var query_string = window.location.search;

            if (query_string) {
                var hashes = query_string.slice(1).split('&');
                for (var i = 0; i < hashes.length; i++) {
                    hash = hashes[i].split('=');
                    vars[hash[0]] = hash[1];
                }

                return vars;
            } else {
                return false;
            }
        },
        showErrorMessage: function(message,type,title) {
            if ($A.util.isEmpty(type)) {
                type = 'error';
            }
            if ($A.util.isEmpty(title)) {
                title = 'Error!';
            }
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                title: title,
                message: message,
                type: type
            });
            toastEvent.fire();
        },
        showMainData : function() {
            var loader = document.getElementById('mainLoader');
            if (loader)
                loader.classList.add('slds-hide');

            var content = document.getElementById('mainContent');
            if (content)
                content.classList.remove('slds-hide');
        },
        showLoadedData : function(component) {
            $A.util.addClass(component.find('loading-span-stencil'),'stencil-hidden');
            setTimeout($A.getCallback(function(){
                $A.util.removeClass(component.find('mainData'),'stencil-hidden');
                $A.util.addClass(component.find('mainData'),'stencil-visible');
                $A.util.removeClass(component.find('buttons'),'stencil-hidden');
                $A.util.addClass(component.find('buttons'),'stencil-visible');
            }),100);
        },
        showComponent: function(component, componentName, params, divId,scrollToTop) {
            $A.createComponent(componentName, params,
                function(cmp,status,message) {
                    if (status !== 'SUCCESS') {
                        console.log(status,message);
                        console.log('Name',componentName);
                        console.log('Params',params);
                    }
                    var divComponent = component.find(divId);
                    divComponent.set("v.body", [cmp]);
                    if (!$A.util.isEmpty(scrollToTop)) {
                        document.body.scrollTop = document.documentElement.scrollTop = 0;
                    }
                });
        },
        disableBodyScroll : function() {
            document.body.classList.add('noscroll');
        },
        enableBodyScroll : function() {
            document.body.classList.remove('noscroll');
        },
        getSalesOrderId: function(orgId) {
            var soCookie = FontevaHelper.getCookie('apex__' + orgId + '-fonteva-lightning-shopping-cart');
            return soCookie ? JSON.parse(soCookie).salesOrderId : null;
        },
        setSalesOrderId: function(orgId, soId) {
            if (soId === undefined) return; //blank out via null
            var soCookieStr = FontevaHelper.getCookie('apex__' + orgId + '-fonteva-lightning-shopping-cart');
            var soCookie = soCookieStr ? JSON.parse(soCookieStr) : {};
            soCookie.salesOrderId = soId;
            FontevaHelper.setCookie('apex__' + orgId + '-fonteva-lightning-shopping-cart',
                JSON.stringify(soCookie), 1);
        },
        nullPromise: function() {
            return new AuraPromise(function(resolve) {
                resolve();
            });
        },
        fireComponentLoaded: function(cmp) {
            $A.get('e.LTE:ComponentLoadedEvent').fire({id: cmp.getLocalId(), name: cmp.getType().split(':')[1]})
        },
        createComponent: function(cmpName, params) {
            var debug = sessionStorage.getItem('fon.log');
            var verbose = debug === "debug";

            if (verbose) console.log('FontevaHelper creating: ' + cmpName);

            var self = this;

            return new AuraPromise(function(resolve, reject) {
                $A.createComponent(cmpName, params, function(cmp, status, message) {
                    if (status !== 'SUCCESS') {
                        self.showErrorMessage('Unable to create ' + cmpName + ' -- ' + message);
                        reject(message);
                    }
                    resolve(cmp);
                });
            })
        },
        waitForComponent: function(cmp, auraId) {
            var foundCmp = cmp.find(auraId);
            if (foundCmp) {
                return new AuraPromise(function(resolve) {
                    resolve (foundCmp);
                })
            }

            return new AuraPromise(function (resolve) {
                var interval = setInterval($A.getCallback(function () {
                    var foundCmp = cmp.find(auraId);
                    if (foundCmp) {
                        clearInterval(interval);
                        resolve(foundCmp);
                    }
                }), 50);
            })
        },
        find: function(cmp, auraId) {
            var cmps = cmp.find(auraId);
            if (!(cmps instanceof Array)) {
                cmps = [cmps];
            }

            return cmps;
        },
        addClass: function(ele, clazz) {
            $A.util.addClass(ele, clazz);
        },
        removeClass: function(ele, clazz) {
            $A.util.removeClass(ele, clazz);
        },
        toggleClass: function(ele, clazz) {
            $A.util.toggleClass(ele, clazz);
        },
        hasClass: function(ele, clazz) {
            return $A.util.hasClass(ele, clazz);
        },
        waitForData: function(cmp, fieldName) {
            fieldName = fieldName || 'v.data';

            var data = cmp.get(fieldName);
            if (data) {
                return new AuraPromise(function (resolve) {
                    resolve(data);
                });
            }

            return new AuraPromise(function (resolve) {
                var interval = setInterval($A.getCallback(function () {
                    var data = cmp.get(fieldName);
                    if (data) {
                        clearInterval(interval);
                        resolve(data);
                    }
                }), 50);
            })
        },
    }
}));
