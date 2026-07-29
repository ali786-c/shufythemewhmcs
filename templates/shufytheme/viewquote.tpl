{include file="{$template}/header.tpl"}



<div class="view__invoice__page__wrapper">
    <div class="invoice-container">
        {if $invalidQuoteIdRequested}
            {include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang key='invoiceserror'}" bodyTextCenter=true}
        {else}
			<div class="view__invoice__page__body">
				<div class="row justify-content-start">
					<div class="col-lg-9 col-md-7 col-12">
						<div class="view__invoice__page__main__content default__shadow__panel">
							<div class="view__invoice__page__main__conent__header default__shadow__panel__header">
								<div class="row justify-content-between">
									<div class="col-md-7 col-12">
										<div class="d-flex align-items-center">
											<h6 class="coodiv-text-8 font-weight-bold mb-0">{lang key='quotenumber'}{$id}</h6>
											<div class="invoice-status ml-3">
												{if $stage eq "Delivered"}
													<span class="draft badge badge-warning">{lang key='quotestagedelivered'}</span>
												{elseif $stage eq "Accepted"}
													<span class="paid badge badge-success">{lang key='quotestageaccepted'}</span>
												{elseif $stage eq "On Hold"}
													<span class="refunded badge badge-primary">{lang key='quotestageonhold'}</span>
												{elseif $stage eq "Lost"}
													<span class="cancelled badge badge-dark">{lang key='quotestagelost'}</span>
												{elseif $stage eq "Dead"}
													<span class="collections badge badge-info">{lang key='quotestagedead'}</span>
												{/if}
											</div>
										</div>
									</div>
									<div class="col-md-5 col-12">
										<div class="view__invoice__text__wrapper">
											<span class="view__invoice__text d-flex align-items-center justify-content-between">{lang key='quotedatecreated'}: <span>{$datecreated}</span></span>
											<span class="view__invoice__text d-flex align-items-center justify-content-between">{lang key='quotevaliduntil'}: <span>{$validuntil}</span></span>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="view__invoice__page__main__conent__body default__shadow__panel__body">
								{if $agreetosrequired}
									{include file="$template/includes/panel.tpl" type="danger" headerTitle="{lang key='error'}" bodyContent="{lang key='ordererroraccepttos'}" bodyTextCenter=true}
								{/if}
								<div class="row justify-content-between">
									<div class="col-md-7 col-12">
									<h6 class="coodiv-text-10 font-weight-bold">{lang key='invoicespayto'}</h6>
									<address class="small-text">
										{$payto}
									</address>
									</div>
									
									<div class="col-md-5 col-12">
										<h6 class="coodiv-text-10 font-weight-bold">{lang key='quoterecipient'}:</h6>
										<address class="small-text">
											{if $clientsdetails.companyname}{$clientsdetails.companyname}<br />{/if}
											{$clientsdetails.firstname} {$clientsdetails.lastname}<br />
											{$clientsdetails.address1}, {$clientsdetails.address2}<br />
											{$clientsdetails.city}, {$clientsdetails.state}, {$clientsdetails.postcode}<br />
											{$clientsdetails.country}
											{if $customfields}
											<br /><br />
											{foreach $customfields as $customfield}
											{$customfield.fieldname}: {$customfield.value}<br />
											{/foreach}
											{/if}
										</address>
									</div>
								</div>
								 {if $proposal}
									<div class="mt-5">
										{include file="$template/includes/panel.tpl" type="warning" headerTitle="{lang key='quoteproposal'}" bodyContent=$proposal}
									</div>
								{/if}
							</div>
							<div class="view__invoice__page__main__content__tables">
								<h6 class="coodiv-text-10 font-weight-bold">{lang key='quotelineitems'}</h6>
								<div class="table-responsive mb-8">
									<table class="table table-sm">
										<thead class="main__thead__table">
										<tr>
											<td>{lang key='invoicesdescription'}</td>
											<td class="text-center">{lang key='quotediscountheading'}</td>
											<td width="20%" class="text-center">{lang key='invoicesamount'}</td>
										</tr>
										</thead>
										<tbody>
										 {foreach $quoteitems as $item}
											<tr>
												<td>{$item.description}{if $item.taxed} *{/if}</td>
												<td class="text-center">{if $item.discountpc > 0}{$item.discount} ({$item.discountpc}%){else} - {/if}</td>
												<td class="text-center">{$item.amount}</td>
											</tr>
										{/foreach}
										
										
										<tr>
											<td colspan="2" class="total-row text-right"><strong>{lang key='invoicessubtotal'}</strong></td>
											<td class="total-row text-center">{$subtotal}</td>
										</tr>
										{if $taxrate}
											<tr>
												<td colspan="2" class="total-row text-right"><strong>{$taxrate}% {$taxname}</strong></td>
												<td class="total-row text-center">{$tax}</td>
											</tr>
										{/if}
										{if $taxrate2}
											<tr>
												<td colspan="2" class="total-row text-right"><strong>{$taxrate2}% {$taxname2}</strong></td>
												<td class="total-row text-center">{$tax2}</td>
											</tr>
										{/if}
										
	
										<tr>
											<td class="total-pay-row"></td>
											<td class="total-pay-row text-right"><strong>{lang key='quotelinetotal'}</strong></td>
											<td class="total-pay-row text-center">{$total}</td>
										</tr>
										</tbody>
									</table>
								</div>
	
								{if $notes}
									{include file="$template/includes/panel.tpl" type="info" headerTitle="{lang key='invoicesnotes'}" bodyContent=$notes}
								{/if}
							{if $taxrate}
								<p class="coodiv-text-11">* {lang key='invoicestaxindicator'}</p>
							{/if}
							</div>
						</div>
					</div>
					
					
					
					
					<div class="col-lg-3 col-md-5 col-12 view__invoice__page__sidebar__wrapper position-relative">
						<div class="view__invoice__page__sidebar__sticky d-print-none">
						{if $stage eq "Delivered" || $stage eq "On Hold"}<button type="button" class="btn btn-success btn-sm d-block w-100" data-toggle="modal" data-target="#acceptQuoteModal"><i class="fas fa-check-circle"></i> {lang key='quoteacceptbtn'}</button>{/if}

						<div class="view__invoice__page__sidebar__actions">
							<h6 class="coodiv-text-11">{lang key='actions'}</h6>
							<a href="dl.php?type=q&amp;id={$quoteid}"><i class="fas fa-download"></i> {lang key='invoicesdownload'}</a>
							<a href="clientarea.php">{lang key='invoicesbacktoclientarea'}</a>
						</div>
						</div>
					</div>	
				</div>
			</div>
		{/if}
	</div>
</div>
	


    <form method="post" action="viewquote.php?id={$quoteid}&amp;action=accept">
        <div class="modal fade" id="acceptQuoteModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">{lang key='quoteacceptbtn'}</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <p>{lang key='quoteacceptagreetos'}</p>
							<div class="form-group mb-1">
							<label id="quoteAcceptAgreeTos" class="coodiv-check-input d-flex">
								<input type="checkbox" class="coodiv-check-input-click" name="agreetos"/>
								<span class="checkbox mr-2"></span>
								<p class="coodiv-text-11 font-weight-500 mb-0 pl-3">{lang key='ordertosagreement'} <a href="{$tosurl}" target="_blank">{lang key='ordertos'}</a></p>
							</label>
						</div>
                        <small>{lang key='quoteacceptcontractwarning'}</small>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{lang key='cancel'}</button>
                        <button type="submit" class="btn btn-primary">{lang key='quoteacceptbtn'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
	
{include file="{$template}/footer.tpl"}
