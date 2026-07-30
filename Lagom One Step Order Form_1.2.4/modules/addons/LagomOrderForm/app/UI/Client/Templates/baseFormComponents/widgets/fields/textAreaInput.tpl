<script type="text/x-template" id="t-mg-one-page-textarea-input-field">
    <div class="panel" v-if="visible">
        <div class="panel-body">
            <h4 class="panel-title" v-html="details.optionname"></h4>
            <div class="form-group m-b-0">
        <textarea class="form-control" v-model="data.value" :placeholder="details.placeholder" v-html="data.value">
        </textarea>
            </div>
        </div>
    </div>
</script>