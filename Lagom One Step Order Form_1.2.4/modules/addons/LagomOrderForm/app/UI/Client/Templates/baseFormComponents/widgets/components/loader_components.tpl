<script type="text/x-template" id="t-mg-one-page-loader-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="message message-lg message-no-data message-fullscreen hidden" v-if="isVisible" id="one-page-order-init-loader" data-order-loader> 
        {* <div id="lottie"></div>
        <span class="message-text message--loading-order">
            You’re almost there! We’re loading your order.
            <span class="message-subtext">
                Please be patient we’re loading product configuration
            </span>
        </span> *}
    </div>
</script>