const billingSectionField = {
    template: '#t-mg-one-page-billing-section-field',
    computed: {
    },
    components:{
        billingUserPasswordField: billingUserPassword,
        textInput: billingTextInput,
        customFieldTextInput: billingTextInput,
        customFieldDropdownInput: billingDropdown,
        customFieldCheckboxInput: billingCheckbox,
        customFieldPasswordInput: billingPassword,
        textareaInput: billingTextArea,
        LinkInput: billingLink,
    },
    props: {
        field: {
            type: Object,
            required: true
        },
        data: null,
    },
};