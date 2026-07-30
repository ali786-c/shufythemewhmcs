/**
 *
 * @param name
 * @param value
 */

function pageOrderRequiredValidator(name, value)
{
    if(typeof value === 'boolean' && value === true)
    {
        return true;
    }

    if(typeof value === 'string' && value && value.replace(/\s/g, '') !== '')
    {
        return true;
    }

    if(typeof value === 'number')
    {
        return true;
    }

    return mgTr(['fieldIsRequired']);

}

/**
 * TODO move to helper function
 * @param object
 * @returns {boolean}
 */
function pageOrderIsObjectEmpty(object)
{
    if(typeof object === 'null' || typeof object === 'undefined'){
        return true;
    }
    if(typeof object === 'string' && object.length === 0)
    {
        return true;
    }
    if(Array.isArray(object) && object.length === 0){
        return true;
    }

    return Object.keys(object).length === 0;
}

/**
 *
 * @param name
 * @param value
 * @returns {boolean}
 */
function pageOrderEmailValidator(name, email)
{
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(re.test(String(email).toLowerCase()))
    {
        return true;
    }

    return mgTr(['invalidEmailAddress']);
}

function pageOrderUrlLinkValidator(name, url)
{

    const pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
        '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
        '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
        '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
        '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
        '(\\#[-a-z\\d_]*)?$','i'); // fragment locator

    if(!!pattern.test(url))
    {
        return true;
    }

    return mgTr(['invalidUrlAddress']);
}

/**
 * custom field validator callback function
 * @param self
 * @param result
 */
function mgPageOrderCustomFieldValidatorCallback(self, result)
{
    if (result === true) {
        if(self.field) {
            pageOrderStore.commit('cartStore/popValidateError', self.field.id);
        }
        else {
            pageOrderStore.commit('cartStore/popValidateError', self.id);
        }
        self.isValidField = true;
        self.fieldValidationMessages = null;
    } else {
        self.isValidField = false;
        self.fieldValidationMessages = result;
        if(self.field) {
            pageOrderStore.commit('cartStore/pushValidateError', {id: self.field.id, error: result});
        }
        else {
            pageOrderStore.commit('cartStore/pushValidateError', {id: self.id, error: result});

        }
    }
}

function productRequiresDomain(name, value)
{
    if (typeof value === 'boolean' && value === true) {
        return true;
    }

    if (typeof value === 'string' && value && value.replace(/\s/g, '') !== '') {
        return true;
    }

    if (typeof value === 'number') {
        return true;
    }

    return mgTr(['productRequiresDomainAddDomainTOCart']);

}
