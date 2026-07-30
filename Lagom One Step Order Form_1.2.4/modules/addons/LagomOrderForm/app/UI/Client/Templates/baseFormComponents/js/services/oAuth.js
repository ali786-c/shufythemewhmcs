
const mgOAuthService = {
  namespaced: true,
  callbackAjaxComplete: function(){},
  initOAuthHandler: function(callbackAjaxComplete){
    this.callbackAjaxComplete = callbackAjaxComplete;
    this.setOnReloadPage();
    this.initButtonsEvent();
  },
  setOnReloadPage(){

    //todo need on reload event listener when sso buttons are available, think about redirection
    // window.onbeforeunload = function(e){
    //   e.preventDefault();
    //   delete e['returnValue'];
    //
    //   return false;
    // }

    // window.addEventListener('beforeunload', function (e) {
    //   // Cancel the event
    //   e.preventDefault(); // If you prevent default behavior in Mozilla Firefox prompt will always be shown
    //   // Chrome requires returnValue to be set
    //   e.returnValue = '';
    // });
  },
  initButtonsEvent: function(){
    var self = this;
    $(document).ajaxComplete(function( event, xhr, settings ) {
      window.stop();
      event.preventDefault();
      var requestPattern = settings.url.split('/').reverse().slice(0,4).join('_');
      switch (requestPattern) {
        case 'finalize_google_signin_provider_auth':
        case 'finalize_facebook_signin_provider_auth':
        case 'finalize_facebook_signin_provider_auth':
          self.callbackAjaxComplete(JSON.parse(xhr.responseText));
          break;
      }
    });
  },
};