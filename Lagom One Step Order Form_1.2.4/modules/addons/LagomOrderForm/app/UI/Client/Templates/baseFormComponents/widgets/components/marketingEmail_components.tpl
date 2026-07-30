<script type="text/x-template" id="t-mg-one-page-marketing-email-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
	<div class="section" v-if="isVisible">
		<div class="section-number" v-if="showNumber">X</div>
		<div class="section-header">
			<h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','marketing','section','title')}</h2>
		</div>
		<div class="section-body">
			<div class="panel panel-form">
				<div class="panel-body">
					<p v-html="description"></p>
					<label class="panel panel-switch m-w-288 panel--no-border" :class="{ 'checked': isChecked}">
						<div class="panel-body">
							<span class="switch-label">{$MGLANG->absoluteT('LagomOrderForm','marketing','receive_emails')}</span>
							<div class="switch switch--lg switch--text">
								<input class="switch__checkbox" type="checkbox" name="marketingoptin" v-model="value">
								<span class="switch__container"><span class="switch__handle"></span></span>
							</div> 
						</div>
					</label>
				</div>
			</div>
		</div>
	</div>    
</script>	