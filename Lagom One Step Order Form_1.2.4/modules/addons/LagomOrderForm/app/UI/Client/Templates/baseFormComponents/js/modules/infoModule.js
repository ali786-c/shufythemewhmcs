const infoModule = {
    namespaced: true,
    actions:{
        infoLog: function({state, commit, dispatch}, {message: message}){
            if(Vue.config.productionTip !== false && typeof console !== 'undefined'){
                console.log('%c' + new Date().toLocaleString() + ' INFO: '+message, 'color: green;')
            }
        },
        errorLog: function({state, commit, dispatch}, {message: message, response: response}){
            if(Vue.config.productionTip !== false  && typeof console !== 'undefined'){
                console.log('%c' + new Date().toLocaleString() + ' ERROR: '+message, 'color: red;')
                if(response !== undefined){
                    console.log(response)
                }
            }
        },
    }
};