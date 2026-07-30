<script type="text/x-template" id="t-mg-one-page-alert-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div id="pageOrderAlert" v-if="isVisible">
        <div class="alert alert-danger">
            <div class="alert-body" v-html="decodeHtml(message)">
            </div>
        </div>
    </div>
</script>
