<script type="text/x-template" id="t-mg-one-page-groups-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div class="main-header-wrapper" v-if="isVisible && layoutSettings.navigationTabs" :class="{ 'main-header-wrapper--promo': cart.promo && !cart.promo.isApplied }">
        <div class="main-header-nav">
            <div class="container tab-nav" data-nav-tabs-container ref="tabSliderContainer">
                <div class="nav-arrow nav-arrow--left nav-arrow--hidden">
                    <a href="#" class="nav-link" data-scrollnav="-250">
                        <i class="ls ls-arrow-left"></i>
                    </a>
                </div>
                <ul class="nav nav-tabs nav-lg" data-nav ref="tabSlider">
                    <li class="nav-item"  :class="{ active: group.id == selectedGroupId}" :href="'#group'+group.id"  v-for="group in groups" v-if="group.hidden !== 1 || group.id == selectedGroupId">
                        <a class="nav-link" href="nav-link"  @click="setGroup($event, group.id)">
                            <input type="radio" :id="'group_'+group.id" :name="group.id">
                            <span v-html="group.name"></span>
                        </a>
                    </li>
                </ul>
                <div class="nav-arrow nav-arrow--right nav-arrow--hidden">
                    <a href="#" class="nav-link" data-scrollnav="250">
                        <i class="ls ls-arrow-right"></i>
                    </a>
                </div>
            </div>
            <div class="modal modal-info fade" id="changeGroupModal">
                <div class="modal-dialog" >
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="lm lm-close"></i></button>
                            <h3 class="modal-title">{$MGLANG->absoluteT('LagomOrderForm','groups', 'modal', 'change', 'title')}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$MGLANG->absoluteT('LagomOrderForm','groups', 'modal', 'change',  'description')} <b>{$MGLANG->absoluteT('LagomOrderForm','groups', 'modal', 'change',  'description_2')}</b></p>
                        </div>
                        <div class="modal-footer d-flex">
                            <button type="button" class="btn btn-primary" @click="confirm(this)">{$MGLANG->absoluteT('LagomOrderForm','groups','modal', 'change','confirm')}</button>
                            <button type="button" class="btn btn-default" @click="close(this)">{$MGLANG->absoluteT('LagomOrderForm','groups', 'modal', 'change', 'close')}</button>
                            
                                <label class="checkbox checkbox-custom checkbox-sm m-l-a m-t-0 m-b-0">
                                    <input type="checkbox" name="popoverNotShowAgain" class="" v-model="hideConfirmationModal">
                                    <span class="checkbox-styled"></span>
                                    <div class="check-content">{$MGLANG->absoluteT('LagomOrderForm','doNotShowAgain')}</div>
                                </label>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>