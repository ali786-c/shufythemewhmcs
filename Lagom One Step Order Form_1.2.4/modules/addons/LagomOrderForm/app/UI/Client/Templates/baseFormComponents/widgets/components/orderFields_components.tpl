<script type="text/x-template" id="t-mg-one-page-order-fields-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
	<div class="section" :class="[{ 'section--full-width': !showNumber}]" v-if="isVisible && layoutSettings.orderFieldsLocation == 'lastOrderFormSection' && !(getSPage == 'addons' && !isOneStep)">
		<div class="section-number" v-if="showNumber">X</div>
		<div class="section-header">
			<h2 class="section-title">{$MGLANG->absoluteT('LagomOrderForm','notes','orderForm','orderFields')}</h2>
		</div>
		<div class="section-body">
			<div class="panel panel-form panel--orderfields">
				<div class="panel-body">
                    <div v-for="(field, fieldIndex) in orderFields">
                        <div class="form-group" :class="{ 'has-error': isValid(data[field.id]) == false }" v-if="field.type == 'checkbox'">
                            <label class="checkbox checkbox-custom">
                                <input type="checkbox" v-model="data[field.id].value" :id="field.id" @change="updateDataValue($event, field.id, $event.target.checked, fieldIndex)">
                                <div class="checkbox-styled"></div>
                                <span v-html="field.name"></span>
                                <span class="control-label-info" v-if="field.required == 'off'" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                            </label>
                            <span class="help-block" v-html="field.description" v-if="field.description"></span>
                            <div class="alert alert-danger alert-sm" v-if="isValid(data[field.id]) == false"
                                v-html="data[field.id].fieldValidationMessages"></div>
                        </div>
                        <div class="form-group" :class="{ 'has-error': isValid(data[field.id]) == false }" v-if="field.type == 'inputText'">
                            <label class="control-label">
                                <span v-html="field.name"></span>
                                <span class="control-label-info" v-if="field.required == 'off'" v-html="'{$MGLANG->absoluteT('LagomOrderForm','orderForm','optional')}'"></span>
                            </label>
                            <input class="form-control" type="text" @input="event => updateDataValue(event, field.id, event.target.value, fieldIndex)" :id="field.id" autocomplete="off">
                            <span class="help-block" v-html="field.description" v-if="field.description"></span>
                            <div class="alert alert-danger alert-sm" v-if="isValid(data[field.id]) == false"
                                v-html="data[field.id].fieldValidationMessages"></div>
                        </div>

                        <div class="panel-actions dropdown form-group" :class="{ 'has-error': isValid(data[field.id]) == false }" v-if="field.type == 'dropdown'">
                            <label class="control-label">
                                <span v-html="field.name"></span>
                            </label>
                            <select class="form-control" v-model="data[field.id].value" @change="updateDataValue($event, field.id, $event.target.value, fieldIndex)">
                               <option v-for="(option, indexOpt) in field.extra" v-html="option" :value="option"></option>
                            </select>
                            <span class="help-block" v-html="field.description" v-if="field.description"></span>
                            <div class="alert alert-danger alert-sm"  v-if="isValid(data[field.id]) == false"
                                v-html="data[field.id].fieldValidationMessages"></div>
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</script>