({
loadData: function(cmp) {
var div = cmp.find('custompaymentmethod');
return $A.createComponent(
'markup://OrderApi:PaymentMethods',
                    {
                        recordId: '005Z0000004jVxXIAU',
                        isThemed: false,
                        isPortal: false,
                        singleGatewayToUse: 'MqCT39q1q6VxCTlott4ZCRyeR0q',
                        hideHeader: true
                    }, function(newCmp, success, message) {
if (success !== 'SUCCESS') {
return;
                        }
div.set('v.body', [newCmp]);
                    }
                );
}})