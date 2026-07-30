{include file="orderforms/standard_cart/common.tpl"}

<div id="order-standard_cart">
    <div class="row justify-content-center">
		<div class="col-md-6 col-12">
			<div class="card">
				<div class="card__header">
					<h6 class="coodiv-text-10 mb-0 text-center">{lang key='orderconfirmation'|default:'Order Confirmation'} <b>#{$ordernumber}</b></h6>
				</div>
				<div class="card__body text-center">
					<i style="font-size: 45px;display: block;margin-bottom: 20px;color: #72df77;" class="fal fa-check"></i>
					<p class="coodiv-text-11">{lang key='orderreceived'|default:'Thank you for your order. You will receive a confirmation email shortly.'}</p>
					<p class="coodiv-text-11">{lang key='orderfinalinstructions'|default:'If you have any questions about your order, please open a support ticket from your client area.'}</p>
					 {if $expressCheckoutInfo}
						<div class="alert alert-info text-center mt-10">
							{$expressCheckoutInfo}
						</div>
					{elseif $expressCheckoutError}
						<div class="alert alert-danger text-center mt-10">
							{$expressCheckoutError}
						</div>
					{elseif $invoiceid && !$ispaid}
						<div class="alert alert-warning text-center mt-10">
							{lang key='ordercompletebutnotpaid'|default:'This order has been completed but not paid for yet.'}
							<br />
							<a href="{$WEB_ROOT}/viewinvoice.php?id={$invoiceid}" target="_blank" class="alert-link">
								{lang key='invoicenumber'|default:'Invoice #'}{$invoiceid}
							</a>
						</div>
					{/if}

					{foreach $addons_html as $addon_html}
						<div class="order-confirmation-addon-output">
							{$addon_html}
						</div>
					{/foreach}

					{if $ispaid}
						<!-- Enter any HTML code which should be displayed when a user has completed checkout here -->
						<!-- Common uses of this include conversion and affiliate tracking scripts -->
					{/if}
				</div>
			<div class="card__footer justify-content-center d-flex">
				<a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default btn-sm">{lang key='orderForm.continueToClientArea'}</a>
			</div>
		</div>
		</div>
		
        <div class="col-12 text-center">
            {if $hasRecommendations}
                {include file="orderforms/standard_cart/includes/product-recommendations.tpl"}
            {/if}
        </div>
    </div>
</div>
