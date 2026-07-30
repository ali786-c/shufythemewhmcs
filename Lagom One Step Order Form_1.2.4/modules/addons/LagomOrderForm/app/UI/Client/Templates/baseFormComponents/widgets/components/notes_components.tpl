<script type="text/x-template" id="t-mg-one-page-notes-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
	<div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible">
		<div class="section-number" v-if="showNumber">X</div>
		<div class="section-header">
			<h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','notes','orderForm','additionalNotes')}</h2>
		</div>
		<div class="section-body">
			<div class="panel panel-form">
				<div class="panel-body">
					<textarea name="notes" class="form-control" rows="4" placeholder="{$MGLANG->absoluteT('LagomOrderForm','notes','ordernotesdescription')}" v-model="message" @change="updateMessage"></textarea>
				</div>
			</div>
		</div>
	</div>    
</script>	