{foreach $renewableItems as $renewableItem}
    <div class="card bg-white h-100 service-renewal mb-7" data-product-name="{$renewableItem.product->name}" data-service-id="{$renewableItem.serviceId}" data-service-domain="{$renewableItem.domain}" {if $renewableItem.renewable === false}style="display: none;" data-is-renewable="false" {else}data-is-renewable="true"{/if}>
        <div class="card__header card__header__no__border d-flex align-items-center justify-content-between gap-10 flex-wrap">
			<div class="text">
				<div class="d-flex align-items-center gap-10 flex-wrap">
					<h6 class="mb-0 coodiv-text-8 font-weight-bold">{$renewableItem.product->name}</h6>
					<span class="badge badge-info"> {$renewableItem.domain}</span>
				</div>
				<p class="coodiv-text-11 font-weight-300">
				 {if is_null($renewableItem.nextDueDate)}
					{lang key='renewService.serviceNextDueDateBasic' nextDueDate={lang key='na'}}
				{else}
					{lang key='renewService.serviceNextDueDateExtended' nextDueDate=$renewableItem.nextDueDate->toClientDateFormat() nextDueDateFormatted=$renewableItem.nextDueDate->diffForHumans()}
				{/if}
				</p>
			</div>
			<div class="info">
				{if $renewableItem.renewable === false}
					<span class="label label-danger">
						{$renewableItem.reason}
					</span>
				{else}
					<span class="label label-warning">
						{lang key='renewService.renewingIn' days=$renewableItem.nextDueDate->diffInDays()}
					</span>
				{/if}
			</div>
		</div>
		{if $renewableItem.renewable === true}
			<div class="card__body pt-0">
				<h6 class="coodiv-text-11 font-weight-600 div-renewal-period-label mb-0">{lang key='renewService.renewalPeriodLabel'}</h6>
				<p class="coodiv-text-11 font-weight-300 div-renewal-period-label">
					{lang key='renewService.renewalPeriod' nextDueDate=$renewableItem.nextDueDate->toClientDateFormat() nextPayUntilDate=$renewableItem.nextPayUntilDate->toClientDateFormat() renewalPrice=$renewableItem.price}
				</p>
			</div>
	    {/if}
        {if !empty($renewableItem.addons)}
            <div class="addon-renewals card__body pt-0" {if $renewableItem.renewableCount <= 0}style="display: none;" data-is-renewable="false" {else}data-is-renewable="true"{/if}>
                <h4 class="coodiv-text-10 font-weight-600">Addons</h4>
                <div class="border-0 bg-white">
                    {include file="orderforms/shufytheme_cart/service-renewal-item.tpl" renewableItems=$renewableItem.addons prefix='a-'}
                </div>
            </div>
        {/if}
		{if $renewableItem.renewable === true}
		<div class="card__footer d-flex justify-content-end mt-auto">
			<button id="renewService{$renewableItem.serviceId}" class="btn btn-success btn-sm btn-add-renewal-to-cart" data-service-id="{$prefix}{$renewableItem.serviceId}">
				<span class="to-add">
					<i class="fas fa-fw fa-spinner fa-spin"></i>
					{lang key='addtocart'}
				</span>
				<span class="added">
					{lang key='domaincheckeradded'}
				</span>
			</button>
		</div>
		{/if}
			
    </div>
{/foreach}