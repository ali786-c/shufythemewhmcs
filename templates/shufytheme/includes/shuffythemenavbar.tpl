{foreach $navbar as $item}
	{if $item->hasChildren()}
		<div menuItemName="{$item->getName()}" class="sidebar__item sidebar__item_dropdown" id="{$item->getId()}-menu-wrapper">
			<div class="sidebar__top">
			  <button aria-label="{$item->getName()} Menu" class="sidebar__head">
				  {if $item->hasIcon()}
				  <i class="side__bar__item__icon {$item->getIcon()}"></i>
				  {else}
				  <i class="side__bar__item__icon fal fa-home"></i>
				  {/if}
				  <span class="side__bar__item__text">{$item->getLabel()}</span>
				  {if $item->getBadge()!=="none" && $item->hasBadge()}
					 <span class="side__bar__item__icon__badge">{$item->getBadge()}</span>
				  {/if}
			  </button>
			</div>
			<div class="sidebar__body links__with__background" id="{$item->getId()}-menu-item">
				<span class="sidebar__dropdown__title">{$item->getLabel()}</span>
				<div class="sidebar__body__scrollable__element">
					{foreach $item->getChildren() as $childItem}
						{if ($childItem->getClass() && (strpos($childItem->getClass(), 'divider') !== false || strpos($childItem->getClass(), 'nav-divider') !== false)) || strpos($childItem->getLabel(), '---') !== false || strpos($childItem->getLabel(), '----') !== false || strpos($childItem->getLabel(), '-----') !== false || $childItem->getLabel() == '-----' || $childItem->getLabel() == '---' || $childItem->getLabel() == '-'}
							<div class="dropdown-divider my-2 border-top opacity-5"></div>
						{else}
							<a href="{if $childItem->getName() eq 'Home' || $childItem->getLabel()|lower eq 'home' || $childItem->getUri() eq 'index.php' || $childItem->getUri() eq "{$WEB_ROOT}/index.php"}https://cloudhoste.eu{else}{$childItem->getUri()}{/if}" class="sidebar__link {if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}" {if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if}>
								 {if $childItem->hasIcon()}
								 <i class="{$childItem->getIcon()}"></i>
								 {/if}
								 {$childItem->getLabel()}
								 {if $childItem->hasBadge()}<span class="childitem__side__bar__item__icon__badge">{$childItem->getBadge()}</span>{/if}
							 </a>
						{/if}
					{/foreach}
				</div>
			</div>
		</div>
	{else}
		<a aria-label="{$item->getName()} link" menuItemName="{$item->getName()}" id="{$item->getId()}" class="sidebar__item {if $item->getClass()} {$item->getClass()}{/if}" href="{if $item->getName() eq 'Home' || $item->getLabel()|lower eq 'home' || $item->getUri() eq 'index.php' || $item->getUri() eq "{$WEB_ROOT}/index.php"}https://cloudhoste.eu{else}{$item->getUri()}{/if}" {if $item->getAttribute('target')} target="{$item->getAttribute('target')}"{/if} data-placement="right" title="{$item->getLabel()}">
			{if $item->hasIcon()}
			<i class="side__bar__item__icon {$item->getIcon()}"></i>
			{else}
			<i class="side__bar__item__icon fal fa-home"></i>
			{/if}
			<span class="side__bar__item__text">{$item->getLabel()}</span>
			{if $item->getBadge()!=="none" && $item->hasBadge()}
				<span class="side__bar__item__icon__badge">{$item->getBadge()}</span>
			{/if}
		</a>
	{/if}	
{/foreach}

