mgPreventEventHelper = function(e){
    e.preventDefault();
};

function LagomOrderFormTelInput(onChangeCountryCode) {
    if (jQuery('body').data('phone-cc-input')) {
        var phoneInput = jQuery('input[name^="phone"], input[name$="phone"], input[name="domaincontactphonenumber"]').not('input[type="hidden"]');
        if (phoneInput.length) {
            var countryInput = jQuery('[name^="country"], [name$="country"]'),
                initialCountry = 'us';
            if (countryInput.length) {
                if(!!countryInput.val()){
                    initialCountry = countryInput.val().toLowerCase();
                }
                //
                if (initialCountry === 'um') {
                    initialCountry = 'us';
                }
            }

            phoneInput.each(function(){
                var thisInput = jQuery(this),
                    inputName = thisInput.attr('name');

                let countryCodeId = 'populatedCountryCode' + inputName ;

                if (inputName === 'domaincontactphonenumber') {
                    initialCountry = jQuery('[name="domaincontactcountry"]').val() ? jQuery('[name="domaincontactcountry"]').val().toLowerCase(): null;
                }
                jQuery(this).before(
                    '<input id="' + countryCodeId + '" type="hidden" name="country-calling-code-' + inputName + '" value="" />'
                );

                if(!initialCountry){
                    console.log('Initial Country Code is Empty!');
                    return;
                }

                thisInput.intlTelInput({
                    preferredCountries: [initialCountry, "us", "gb"].filter(function(value, index, self) {
                        return self.indexOf(value) === index;
                    }),
                    initialCountry: initialCountry,
                    autoPlaceholder: 'polite', //always show the helper placeholder
                    separateDialCode: true
                });



                thisInput.on('countrychange', function (e, countryData) {
                    onChangeCountryCode(countryData)
                    jQuery('#' + countryCodeId).val(countryData.dialCode);
                    if (jQuery(this).val() === '+' + countryData.dialCode) {
                        jQuery(this).val('');
                    }
                });
                thisInput.on('blur keydown', function (e) {
                    if (e.type === 'blur' || (e.type === 'keydown' && e.keyCode === 13)) {
                        var number = jQuery(this).intlTelInput("getNumber"),
                            countryData = jQuery(this).intlTelInput("getSelectedCountryData"),
                            countryPrefix = '+' + countryData.dialCode;

                        if (number.indexOf(countryPrefix) === 0 && (number.match(/\+/g) || []).length > 1) {
                            number = number.substr(countryPrefix.length);
                        }
                        jQuery(this).intlTelInput("setNumber", number);
                    }
                });
                jQuery('#' + countryCodeId).val(thisInput.intlTelInput('getSelectedCountryData').dialCode);

                countryInput.on('change', function() {
                    if (thisInput.val() === '') {
                        var country = jQuery(this).val()? jQuery(this).val().toLowerCase(): null;
                        if (country === 'um') {
                            country = 'us';
                        }
                        phoneInput.intlTelInput('setCountry', country);
                    }
                });

            });
        }
    }
}