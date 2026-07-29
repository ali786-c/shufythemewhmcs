{if file_exists("templates/$template/includes/theme-core/overwrites/loader.tpl")}
{include file="{$template}/includes/theme-core/overwrites/loader.tpl"}
{else}
{if $coodivsettings.customthemeloader|default:''=='loaderstyleone' }
<span class="shufytheme__loader__one"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstyletwo'}
<span class="shufytheme__loader__two"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylethree'}
<span class="shufytheme__loader__three"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylefour'}
<span class="shufytheme__loader__four"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylefive'}
<span class="shufytheme__loader__five"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylesix'}
<span class="shufytheme__loader__six"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylesaven'}
<span class="shufytheme__loader__saven"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstyleeight'}
<span class="shufytheme__loader__eight"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstylenighn'}
<span class="shufytheme__loader__nigne"></span>
{else if $coodivsettings.customthemeloader|default:''=='loaderstyleteen'}
<span class="shufytheme__loader__teen"></span>
{else}
<div class="boxes__loading"><div class="box"><div></div><div></div><div></div><div></div></div><div class="box"><div></div><div></div><div></div><div></div></div><div class="box"><div></div><div></div><div></div><div></div></div><div class="box"><div></div><div></div><div></div><div></div></div></div>
{/if}
{/if}     