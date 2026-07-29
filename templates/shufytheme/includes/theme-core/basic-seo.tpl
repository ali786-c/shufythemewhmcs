<link rel="shortcut icon" type="image/x-icon" href="{if $coodivsettings.seositefavicon|default:'' == null}{$WEB_ROOT}/templates/{$template}/assets/img/favicon.ico{else}{$coodivsettings.seositefavicon|default:''}{/if}">
<meta name="description" content="{$coodivsettings.seositedescription|default:''}">
<meta name="owner" content="{$coodivsettings.seoorganizationname|default:''}">
<meta name="copyright" content="{if $coodivsettings.seositename|default:'' == null}{$companyname}{else}{$coodivsettings.seositename|default:''}{/if}">
<meta name="category" content="{$coodivsettings.seocontacttype|default:''}">
<meta name="classification" content="{$coodivsettings.seowebsitetype|default:''}">
<meta name="locale" content="{$LANG.locale}" />
<meta property="og:locale" content="{$LANG.locale}" />
<meta property="og:site_name" content="{if $coodivsettings.seositename|default:'' == null}{$companyname}{else}{$coodivsettings.seositename|default:''}{/if}" />
<meta property="og:type" content="{$coodivsettings.seowebsitetype|default:''}" />
<meta property="og:title" content="{if $coodivsettings.seositename|default:'' == null}{$companyname}{else}{$coodivsettings.seositename|default:''}{/if}" />
<meta property="og:description" content="{$coodivsettings.seositedescription|default:''}" />
<meta property="og:url" content="{$systemsslurl}" />
<meta property="og:image" content="{if $coodivsettings.seoopengraph|default:'' == null}https://coodiv.net/blog/wp-content/uploads/2022/05/placeholder.jpg{else}{$coodivsettings.seoopengraph|default:''}{/if}" />
<meta property="og:image:secure_url" content="{if $coodivsettings.seoopengraph|default:'' == null}https://coodiv.net/blog/wp-content/uploads/2022/05/placeholder.jpg{else}{$coodivsettings.seoopengraph|default:''}{/if}" />
<meta name="twitter:image" content="{if $coodivsettings.seoopengraph|default:'' == null}https://coodiv.net/blog/wp-content/uploads/2022/05/placeholder.jpg{else}{$coodivsettings.seoopengraph|default:''}{/if}" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="{$coodivsettings.seotwitterusername|default:''}" />
<meta name="twitter:title" content="{if $coodivsettings.seositename|default:'' == null}{$companyname}{else}{$coodivsettings.seositename|default:''}{/if}" />
<meta name="twitter:description" content="{$coodivsettings.seositedescription|default:''}" />
<meta name="og:phone_number" content="{$coodivsettings.seoorganizationphonenumber|default:''}"/>
<meta name="phone_number" content="{$coodivsettings.seoorganizationphonenumber|default:''}"/>