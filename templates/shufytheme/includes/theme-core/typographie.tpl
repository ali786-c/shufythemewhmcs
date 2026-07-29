<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- Theme google fonts  -->
{if ($language == 'arabic' || $language == 'hebrew' || $language == 'farsi')}
{if $coodivtypographiesettings.themesettingtyponamertl|default:''=='noto'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/noto.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponamertl|default:''=='rubik'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/rubik-rtl.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponamertl|default:''=='tajawal'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/tajawal.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponamertl|default:''=='kufam'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/kufam.css?v=1.2.6">
{else}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/cairo.css?v=1.2.6">
{/if}
{else}
{if $coodivtypographiesettings.themesettingtyponame|default:''=='lato'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/lato.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='abhaya'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/abhaya.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='merriweather'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/merriweather.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='alegreya'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/alegreya.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='montserrat'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/montserrat.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='aleo'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/aleo.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='muli'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/muli.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='arapey'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/arapey.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='nunito'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/nunito.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='asap'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/asap.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='assistant'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/assistant.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='open-sans'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/open-sans.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='barlow'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/barlow.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='oswald'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/oswald.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='bitter'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/bitter.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='poppins'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/poppins.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='brawler'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/brawler.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='roboto'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/roboto.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='caladea'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/caladea.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='rokkitt'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/rokkitt.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='carme'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/carme.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='rubik'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/rubik.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='encode'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/encode.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='enriqueta'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/enriqueta.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='source-sans-pro'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/source-sans-pro.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='frank-ruhl-libre'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/frank-ruhl-libre.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='spectral'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/spectral.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='work-sans'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/work-sans.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='gelasio'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/gelasio.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='headland-one'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/headland-one.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='ubuntu'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/ubuntu.css?v=1.2.6">
{else if $coodivtypographiesettings.themesettingtyponame|default:''=='exo'}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/exo.css?v=1.2.6">
{else}
<link rel="stylesheet" media="all" href="{$WEB_ROOT}/templates/{$template}/assets/google-fonts-caller/inter-tight.css?v=1.2.6">
{/if}
{/if}