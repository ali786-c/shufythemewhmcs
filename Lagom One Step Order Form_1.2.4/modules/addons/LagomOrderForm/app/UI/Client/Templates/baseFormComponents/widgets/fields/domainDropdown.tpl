<script type="text/x-template" id="t-mg-one-page-domain-dropdown-field">
    <div class="form-group" >
        <label v-html="getTranslatedMessage(field.displayName)"></label>
        <select class="form-control" v-model="value" @change="change">
            <option v-for="option in field.options" :value="option.id" v-html="getTranslatedMessage(option.name)"></option>
        </select>
    </div>
</script>