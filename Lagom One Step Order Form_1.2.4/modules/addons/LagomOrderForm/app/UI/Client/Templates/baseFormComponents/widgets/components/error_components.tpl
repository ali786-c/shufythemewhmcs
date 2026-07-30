<script type="text/x-template" id="t-mg-one-page-global-error-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="section" v-if="isVisible">
        <div class="message message-danger message-lg message-no-data">
            <div class="message-icon">
                <i class="lm lm-close"></i>
            </div>
            <h3 class="message-text message-title">{$MGLANG->absoluteT('LagomOrderForm','errors', 'occur')}</h3>

            <p class="text-center text-light" v-if="error && error.message" v-html="error.message"></p>
        </div>
    </div>
</script>