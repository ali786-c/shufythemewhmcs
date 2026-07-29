{* ShufyTheme Standalone Engine Initializer *}
{if !$shuffythemeversion}
    {assign var="shuffythemeversion" value="1.3.2" scope="global"}
{/if}

{if !$LANG.shufytheme.trustedByThousands}
    {assign var="shufyLangDefaults" value=[
        'domainregisterregisiter' => 'Register',
        'ordernowbutton' => 'Order Now',
        'orderpaymenttermmonthly' => 'Monthly',
        'orderpaymenttermquarterly' => 'Quarterly',
        'orderpaymenttermsemiannually' => 'Semi-Annually',
        'orderpaymenttermannually' => 'Annually',
        'orderpaymenttermbiennially' => 'Biennially',
        'orderpaymenttermtriennially' => 'Triennially',
        'orderpaymenttermonetime' => 'One Time',
        'orderfree' => 'Free',
        'checkdomainpricing' => 'Check Pricing',
        'registerdomain' => 'Register Domain',
        'trustedByThousands' => 'Trusted By Thousands',
        'instantDomainsWorldwide' => 'We provide instant domains to customers worldwide.',
        'lowestPrices' => 'Lowest Prices',
        'bestDomainsAffordablePrices' => 'You can trust us to give you the best domain names at affordable prices.',
        'poweredByOurTeam' => 'Powered by Our Team',
        'expertTeamDomainHelp' => 'Our expert team is ready to help you secure the perfect name for your domain.',
        'bestDomainsProvider' => 'The best domains provider',
        'whyBuyDomainWithUs' => 'Why should you buy a domain with us.',
        'optimizedServerSpeed' => "With our latest optimized server hardware, you'll get faster sites — up to nearly 40% average improvement in overall server response times.",
        'privacyProtection' => 'Privacy Protection',
        'freePrivacyForever' => 'Free privacy protection, forever.',
        'supportTeam' => 'Support Team',
        'support24_7' => "24/7 phone and chat support. Talk to a real person in your preferred language.",
        'domainExtensions' => '500+ domain extensions',
        'over500DomainExtensions' => 'Easily find available domains from over 500 domain extensions.',
        'realTimeMonitoring' => 'Real-time monitoring',
        'monitoringAlwaysUp' => "Real-time monitoring to make sure you're always up and running.",
        'domainsPrivacy' => 'Domains privacy',
        'privacySafeguards' => 'Experience enduring privacy safeguards at no cost with our commitment to free privacy protection for domains, ensuring your online presence remains secure and confidential indefinitely.',
        'freePrivacyProtection' => 'Free privacy protection',
        'domainPrivacyDetails' => 'Our domains include free privacy protection** to guard your personal info by replacing it with proxy info in the public WHOIS directory. We also prevent spam with private email for domain inquiries.',
        'ultimateDomainProtectionPlans' => 'Ultimate Domain Protection plans',
        'ultimateProtectionDetails' => 'Our Full and Ultimate Domain Protection plans include protection against domain hijackers and prevention of honest mistakes like accidental expirations and transfers. They also guard against unauthorized access.',
        'availableDomainExtensions' => 'Available Domain Extensions',
        'domainExtensionsDescription' => 'We offer a lot of different domain extensions in order to meet the needs of more people and to be adapted to all uses',
        'frequentlyAskedQuestions' => 'Frequently Asked Questions',
        'faqDescription' => "Below you'll find answers to the questions we get asked the most about our services.",
        'faqQ1' => 'What is a domain name?',
        'faqA1' => 'A domain name is what makes your site visible to the outside world. For example, our domain name is coodiv.net, the address you used to get here. A domain name is where your online presence begins. These days, it’s possibly more important than having a phone number. With our instant domains search, you can check domain name availability and find a specific name for your site.',
        'faqQ2' => 'What is the difference between a domain and web hosting?',
        'faqA2' => 'A domain is an actual name or address people will use to navigate to your website. Web hosting is what powers the storage and back end of your site to make it functional. You can order a domain without web hosting, but you can’t purchase hosting without a domain name.',
        'faqQ3' => 'What is the difference between .com, .net, and .org domain endings?',
        'faqA3' => 'In the earlier days of the Internet, you were limited to three top-level domains (TLDs), also referred to as domain extensions or domain endings. These were:<br>However, times have changed and there are now hundreds of different TLDs, the most popular extensions being .biz, .us, .dev, .xyz, and so on. This gives you many options to choose from. While .com is the most popular domain extension, you are welcome to search for the extensions that work best for you.',
        'faqQ4' => 'How do domain registrations work?',
        'faqA4' => 'To register your domain name, you first need to check if it is available. You can use our search function to check the domain names that you’re interested in. If you find an available domain that you like, you can register it to own it. Registering a domain name means you will need to pay a yearly renewal fee, for example $12.98 per year for a .com extension. If you don’t pay this renewal fee, the domain name becomes available for registration again.',
        'faqQ5' => 'Can I register more than one domain for my website?',
        'faqA5' => 'Yes! You can register as many domains as you’d like for your website. For example, coodiv.net is our primary domain, but we own many other domains that redirect to our website, such as coodiv.cloud.',
        'domains__findyourperfect' => 'Find Your Perfect',
        'domains__domainname' => 'Domain Name',
        'getyourdreaddomain' => 'Get Your Dream Domain Name in Seconds!',
        'domainsspotlighttlds' => 'Spotlight TLDs:'
    ] scope="global"}
    {if $LANG && $LANG.shufytheme}
        {assign var="tmpShufy" value=$shufyLangDefaults|array_merge:$LANG.shufytheme}
        {assign var="LANG" value=$LANG|array_merge:['shufytheme' => $tmpShufy] scope="global"}
    {elseif $LANG}
        {assign var="LANG" value=$LANG|array_merge:['shufytheme' => $shufyLangDefaults] scope="global"}
    {else}
        {assign var="LANG" value=['shufytheme' => $shufyLangDefaults] scope="global"}
    {/if}
{/if}

{if !$coodivsettings}
    {assign var="coodivsettings" value=[
        'id' => '1',
        'customthemeloader' => 'loaderdisbaled',
        'userdropdown' => 'activated',
        'cartdropdown' => 'activated',
        'notificationdropdown' => 'activated',
        'customersnotifications' => '',
        'gravatar' => 'activated',
        'loginstyle' => 'loginstyleone',
        'registerstyle' => 'registerstyleone'
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
