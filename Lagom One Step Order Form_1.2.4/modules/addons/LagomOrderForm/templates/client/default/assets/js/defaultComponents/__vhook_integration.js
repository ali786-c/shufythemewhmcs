
var mgIntegrationHelper = {
    //help determine what part of app should be integrated
    getIngegrationInsertType: function(isIntegration) {
        var allowedInsertTypes= ['full', 'content', 'mc_content'];
        var intParam = $(isIntegration).attr('mg-integration-insert-type');
        if (allowedInsertTypes.includes(intParam)) {
            return intParam;
        } else {
            return 'full';
        }
    },
    //get integration HTML code to be passed on the page
    getIngegrationCode: function(selector, integrationInsertType) {
        if(integrationInsertType === 'full'){
            return $(selector).parents('.mg-integration-container').children('#layers').first()[0].outerHTML;
        } else if (integrationInsertType === 'mc_content') {
            return $(selector)[0].innerHTML;
        } else {
            return $(selector)[0].outerHTML;
        }
    },
    removeOldContainer: function(selector, integrationInsertType, integrationTarget) {
        return $(selector)[0].remove();
    },
    afterInsertActions: function(selector, integrationInsertType, integrationTarget) {
        if (integrationInsertType === 'full') {
            var modalContId = $('#' + $(selector).attr('id') + '_modal');
            $(integrationTarget).find(modalContId).first().remove();
        }
    }
}

mgEventHandler.on('AppsPreLoad', null, function(id, params){
    if (typeof params.appContainers !== 'undefined') {
        //check all app container, looking for integration containers
        for (let key in params.appContainers) {
            if (!params.appContainers.hasOwnProperty(key)) {
                continue;
            }

            //each integration container needs to have 'mg-integration-container' class
            let isIntegration = $(params.appContainers[key]).parents('.mg-integration-container');

            if (isIntegration.length === 1) {
                let integrationInsertType = mgIntegrationHelper.getIngegrationInsertType(isIntegration);
                let tempIntCode = mgIntegrationHelper.getIngegrationCode(params.appContainers[key], integrationInsertType);
                let integrationType = $(isIntegration).attr('mg-integration-type');
                let integrationTarget = $(isIntegration).attr('mg-integration-target');

                if (integrationType === 'append') {
                    mgIntegrationHelper.removeOldContainer(params.appContainers[key], integrationInsertType, integrationTarget);
                    $(integrationTarget).append(tempIntCode);
                    mgIntegrationHelper.afterInsertActions(params.appContainers[key], integrationInsertType, integrationTarget);
                } else if(integrationType === 'replace') {
                    mgIntegrationHelper.removeOldContainer(params.appContainers[key], integrationInsertType, integrationTarget);
                    $(integrationTarget).replaceWith(tempIntCode);
                    mgIntegrationHelper.afterInsertActions(params.appContainers[key], integrationInsertType, integrationTarget);
                } else if(integrationType === 'after') {
                    mgIntegrationHelper.removeOldContainer(params.appContainers[key], integrationInsertType, integrationTarget);
                    $(integrationTarget).after(tempIntCode);
                    mgIntegrationHelper.afterInsertActions(params.appContainers[key], integrationInsertType, integrationTarget);
                } else if(integrationType === 'before') {
                    mgIntegrationHelper.removeOldContainer(params.appContainers[key], integrationInsertType, integrationTarget);
                    $(integrationTarget).before(tempIntCode);
                    mgIntegrationHelper.afterInsertActions(params.appContainers[key], integrationInsertType, integrationTarget);
                } else if(integrationType === 'prepend') {
                    mgIntegrationHelper.removeOldContainer(params.appContainers[key], integrationInsertType, integrationTarget);
                    $(integrationTarget).prepend(tempIntCode);
                    mgIntegrationHelper.afterInsertActions(params.appContainers[key], integrationInsertType, integrationTarget);
                } else if(integrationType === 'custom') {
                    let contId = $(params.appContainers[key]).attr('id');
                    let integrationFunction = $(isIntegration).attr('mg-integration-function');
                    if (integrationFunction && typeof window[integrationFunction] === "function") {
                        window[integrationFunction](integrationTarget, contId, params.appContainers[key]);
                    }

                    //ToDo rewrite and add if requried

                    // if (integrationTarget !== 'null') {
                    //     $(params.appContainers[key])[0].remove();
                    //     $(integrationTarget).addClass('vue-app-main-container');
                    //     if (typeof $(integrationTarget).attr('id') === 'undefined'){
                    //         $(integrationTarget).attr('id', contId);
                    //     }
                    //
                    // }
                }
            }
        }
    }
}, 3000);
