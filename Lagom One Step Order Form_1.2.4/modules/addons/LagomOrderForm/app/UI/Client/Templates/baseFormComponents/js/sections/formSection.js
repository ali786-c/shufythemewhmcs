const vForm = {
    template: '#t-mg-one-page-form-field',
    components: {
        textInput: textInput,
        checkboxInput: checkboxInput,
        passwordInput: passwordInput,
        dropdownInput: dropdownInput,
        textareaInput: textareaInput,
        radioInput: radioInput,
        quantityInput: sliderInput,//sliderInput,

        addonSection: addonFormSection,
        //for product custom field
        customFieldDropdownInput: customDropdown,
        customFieldCheckboxInput: customCheckbox,
        customFieldTextInput: customTextInput,
        customFieldLink: customLinkInput,
        customFieldTextArea: customTextAreaInput,
        customFieldPasswordInput: customPasswordnput,
    },
    props: {
        schema: {
            type: Object,
            required: true
        },
        data: {
            required: true
        },
    },
};