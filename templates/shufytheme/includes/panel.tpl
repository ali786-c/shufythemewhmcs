<div class="row w-100 mx-auto mb-3">
    <div class="card w-100">
        {if isset($headerTitle)}
            <div class="card__header">
				<h6 class="coodiv-text-10 mb-0 font-weight-bold">{$headerTitle}</h6>
			</div>
        {/if}
        {if isset($bodyContent)}
            <div class="card__body {if isset($bodyTextCenter)} text-center{/if}">
                <p class="coodiv-text-11 font-weight-300">{$bodyContent}</p>
            </div>
        {/if}
        {if isset($footerContent)}
            <div class="card__footer {if isset($footerTextCenter)} text-center{/if}">
                {$footerContent}
            </div>
        {/if}
    </div>
</div>
