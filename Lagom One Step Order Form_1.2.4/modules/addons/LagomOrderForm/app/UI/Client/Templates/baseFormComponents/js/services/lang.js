function mgTr(lang, replace){
    return mgPageLang.translate(lang, replace)
};

function mgTranslate(){
    return mgPageLang.translate(arguments);
};

const mgPageLang = {
    translate(lang, replace){
        if(typeof lang == 'string'){
            lang = [lang];
        }
        let langs = pageOrderStore.getters['cartStore/getLang']();

        let translated = this.getTranslation(lang, langs)
        let result = this.getResult(lang, translated);
        result = this.setReplacements(result, replace);

        return result;
    },
    getTranslation(lang, langs){

        for (const [key, value] of Object.entries(lang)) {
            if(langs && langs[value] !== undefined){
                var langs = langs[value]
            }else{
                return false;
            }
        }
        return langs;
    },
    getResult(lang, translated){
        let result = null;
        if(translated === false){
            result = '$_LANG[\'addonCA\'][\'order\'][\'mainContainer\'][\'LagomOrderForm\'][\'clientArea\'][\'scripts\'][\'' + lang.join('\'][\'') + '\']';
        }else if(typeof translated == 'object'){
            console.log('lang object:' + translated);
            result = 'Lang string is an object: ' + '$_LANG[\'addonCA\'][\'order\'][\'mainContainer\'][\'LagomOrderForm\'][\'clientArea\'][\'scripts\'][\'' + lang.join('\'][\'') + '\']';
        }else if(typeof translated == 'string'){
            result = translated;
        }
        return result;
    },
    setReplacements(translated, replacements)
    {
        if(replacements === undefined)
        {
            return translated;
        }
        for (const [key, value] of Object.entries(replacements)) {
            let name = translated.indexOf(':'+key+':') !== -1 ? ':'+key+':' : ':'+key;
            translated = translated.replace(name, value);
        }

        return translated;
    },
    sprintf()
    {
        if(typeof arguments[0] === 'undefined')
        {
            return null;
        }

        let messageParts = arguments[0].split(' ');
        let replaceIndex = 1;

        for(let i=0; i<=messageParts.length;i++)
        {
            if(messageParts[i] === '%s' && arguments[replaceIndex] !== undefined)
            {
                messageParts[i] = arguments[replaceIndex];
                replaceIndex++;
            }
        }
        return messageParts.join(' ');
    }

};
