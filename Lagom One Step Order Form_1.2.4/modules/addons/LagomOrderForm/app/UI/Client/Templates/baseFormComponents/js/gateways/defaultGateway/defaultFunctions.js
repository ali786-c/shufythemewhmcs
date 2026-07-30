function mgDefaultMount(data, gateway) {
    if (gateway.type.toLowerCase() === 'cc') {
        mgCCCardForm.mount(gateway);
    }
};

function mgDefaultPreOrder(data, gateway) {
};

function mgDefaultChangeCard(data, gateway) {
    mgCCCardForm.data.ccinfo = data.ccinfo;
};

function mgDefaultFormData(data, gateway) {

    // if (mgCCCardForm.data.ccinfo !== 'new') {
    //     return {};
    // }

    var formData = {};
    $('#mg-card-container-' + gateway.gatewayKey).find("input").each(function () {

        formData[jQuery(this).attr("name")] = jQuery(this).val();
    });

    return formData;
};


const mgCCCardForm = {

    data: {
        ccinfo: 'new',
        mounted: [],
    },
    mount(gateway) {
        const self = this;

        let cardId = 'mg-card-' + gateway.gatewayKey;
        let card = document.getElementById(cardId);

        if(card){
            card.addEventListener('input', function (event) {
                self.cardListener(cardId, event);
            })
        }else{
            //todo not found
        }

        let cardExpiryId = 'mg-card-expiry-' + gateway.gatewayKey;
        let cardExpiry = document.getElementById(cardExpiryId);

        if(cardExpiry){
            cardExpiry.addEventListener('input', function (event) {
                self.cardExpiryListener(cardId, event);
            });
        }


        let cardCcvId = 'mg-card-cvv-' + gateway.gatewayKey;
        let cardCcv = document.getElementById(cardCcvId);

        if(cardCcv){
            cardCcv.addEventListener('input', function (event) {
                self.cardCVListener(cardId, event);
            });
        }
    },
    cardListener(cardId, event) {
        event.target.value = creditCardFormat(event.target.value);
    },
    cardExpiryListener(cardId, event) {
        event.target.value = expiryFormat(event.target.value);
    },
    cardCVListener(cardId, event) {
        event.target.value = ccvFormat(event.target.value);
    },
    displayError() {

    },
};

function expiryFormat(value) {

    var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '');
    var matches = v.match(/\d{2,4}/g);
    if (matches && matches[0]) {
        return matches[0].substring(0, 2) + ' / ' + matches[0].substring(2, 4);
    }
    return v;
}

function ccvFormat(value) {
    var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '').substring(0, 4);
    return v;
}

function creditCardFormat(value) {
    var value = value
    var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
    var matches = v.match(/\d{4,16}/g);
    var match = matches && matches[0] || ''
    var parts = []
    for (i = 0, len = match.length; i < len; i += 4) {
        parts.push(match.substring(i, i + 4))
    }
    if (parts.length) {
        value = parts.join(' ')
    }

    return value;
}