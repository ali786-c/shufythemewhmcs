{* ShufyTheme Standalone Engine Initializer *}
{if !$shuffythemeversion}
    {assign var="shuffythemeversion" value="1.3.2" scope="global"}
{/if}

{if !$coodivsettings}
    {assign var="coodivsettings" value=[
        'id' => '1',
        'customthemeloader' => 'loaderdisbaled',
        'userdropdown' => 'activated',
        'cartdropdown' => 'activated',
        'notificationdropdown' => 'activated',
        'customersnotifications' => '',
        'gravatar' => 'activated'
    ] scope="global"}
{/if}

{if !$coodivcolorsettings}
    {assign var="coodivcolorsettings" value=[
        'id' => '1',
        'allowdarkmode' => 'activated',
        'darkmodefault' => '',
        'dafaultthemecolor' => 'default-color'
    ] scope="global"}
{/if}

{if !$coodivsidebaroptions}
    {assign var="coodivsidebaroptions" value=[
        'id' => '1',
        'themesidebarsettingsfixedtopheader' => 'activated',
        'themesidebarsettingsfixedhorizontalmenu' => 'activated',
        'themesidebarsettingsfixedsecondarymenu' => 'activated',
        'themesidebarsettingssidebaronhover' => 'activated',
        'themesidebarsettingschildonhover' => 'activated',
        'themesidebarsettingsdarkicons' => '',
        'themesidebarsettingswithouticons' => '',
        'themesidebarsettingfullwidthtopheader' => 'activated',
        'themesidebarsettingfullwithhorizontalmenu' => 'activated',
        'themesidebarsettingsdarkmode' => '',
        'themesidebarsettingsallowusertoexpend' => 'activated',
        'themesidebarsettingsallowusertocollapse' => 'activated',
        'themesidebarsettingscollapsed' => ''
    ] scope="global"}
{/if}

{if !$coodivlayoutssettings}
    {assign var="coodivlayoutssettings" value=[
        'id' => '1',
        'layoutsettingssidebarlayout' => 'minimalist__sidebar',
        'layoutsettingssidebarposition' => 'sidebarpositionleft',
        'layoutsettingssidebarstyle' => 'sidebarheaderlogo'
    ] scope="global"}
{/if}

{if !$coodivhomepagesettings}
    {assign var="coodivhomepagesettings" value=[
        'id' => '1',
        'themehomepagesettingmarketconnectbannaers' => 'activated',
        'themehomepagesettingmarketconnectbannaersnav' => 'activated',
        'themehomepagesettinghomepagefeaturedsection' => 'activated',
        'themehomepagesettingservicesfeatures' => 'activated',
        'themehomepagesettingannouncements' => 'activated',
        'themehomepagesettingsavingbanner' => 'activated',
        'themehomepagesettingsubscribingsection' => 'activated'
    ] scope="global"}
{/if}

{if !$CoodivMarketConnectServices}
    {assign var="CoodivMarketConnectServices" value=[
        ['name' => 'sitebuilder', 'productGroup' => ['slug' => 'website-builder']],
        ['name' => 'codeguard', 'productGroup' => ['slug' => 'codeguard']],
        ['name' => 'sitelock', 'productGroup' => ['slug' => 'sitelock']],
        ['name' => 'spamexperts', 'productGroup' => ['slug' => 'spamexperts']],
        ['name' => 'marketgoo', 'productGroup' => ['slug' => 'marketgoo']],
        ['name' => 'weebly', 'productGroup' => ['slug' => 'weebly']]
    ] scope="global"}
{/if}

{if !$shuffythemedirection || $shuffythemedirection|strpos:'verificationcheck' !== false}
    {assign var="shuffythemedirection" value="$template/includes/theme-core/header-layouts/header-default-layout.tpl" scope="global"}
{/if}

{if !$shuffythemedirectionfooter || $shuffythemedirectionfooter|strpos:'verificationcheck' !== false}
    {assign var="shuffythemedirectionfooter" value="$template/includes/theme-core/footer-layouts/footer-default-layout.tpl" scope="global"}
{/if}
