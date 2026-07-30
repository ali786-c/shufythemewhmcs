<script type="text/x-template" id="t-mg-one-page-text-input-field">
    <div class="panel" v-if="visible">
        <div class="panel-body">
            <h4 class="panel-title" v-html="details.optionname"></h4>
            <div class="form-group m-b-0">
                <input class="form-control" type="text" v-model="data.value" :placeholder="details.placeholder">
            </div>
        </div>
    </div>
</script>