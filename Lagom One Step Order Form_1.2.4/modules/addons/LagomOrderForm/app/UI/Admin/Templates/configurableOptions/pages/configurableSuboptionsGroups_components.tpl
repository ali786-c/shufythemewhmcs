<script type="text/x-template" id="t-mg-{$elementId|strtolower}"
        :component_id="component_id"
        :component_namespace="component_namespace"
        :component_index="component_index"
>
    <div id="itemContentContainer">
        <div id="mg-templateContainer">
            <div class="widgetActionComponent vueDatatableTable" id="{$elementId}" namespace="{$namespace}" index="{$rawObject->getIndex()}" actionid="{$rawObject->getRawCategoryId()}">
                <div class="lu-widget__body">
                    <div class="lu-t-c datatableLoader" data-table-container data-check-container >
                        {if $rawObject->isViewTopBody()}
                            <div class="lu-t-c__top lu-top mob-top-search">
                                <div class="lu-top__toolbar"> {$rawObject->insertSearchForm()} </div>
                                <div class="lu-top__toolbar">
                                    {foreach from=$rawObject->getButtons() key=buttonKey item=buttonValue}
                                        {$buttonValue->getHtml()}
                                    {/foreach}
                                    {if $rawObject->hasDropdawnButton()}
                                        {$rawObject->getDropdawnButtonHtml()}
                                    {/if}
                                </div>
                            </div>
                        {/if}
                        <div class="lu-t-c__mass-actions lu-top">
                            <div class="lu-top__title"><span class="lu-badge lu-badge--primary lu-value">0</span> {$MGLANG->absoluteT('datatableItemsSelected')}</div>
                            <div class="lu-top__toolbar">
                                {if $rawObject->hasMassActionButtons()}
                                    {foreach $rawObject->getMassActionButtons() as $maButton}
                                        {$maButton->getHtml()}
                                    {/foreach}
                                {/if}
                            </div>
                            <div class="drop-arrow{if $rawObject->isvSortable()} drop-arrow-sorting{/if}"></div>
                        </div>

                        {***DATATABLE*BODY******************************************************************}

                        <div class="dataTables_wrapper no-footer suboptionsGroupsTableDiv">
                            <div>
                                <table  class="lu-table lu-table--mob-collapsible dataTable no-footer dtr-column" width="100%" v-show="loading === false" role="grid">
                                    <thead>
                                    <tr role='row'>
                                        {assign var="collArrKeys" value=$customTplVars.columns|array_keys}
                                        {foreach from=$customTplVars.columns key=tplKey item=tplValue}
                                            {if $rawObject->hasMassActionButtons() && $collArrKeys[0] === $tplKey}
                                                <th class="{if $tplValue->orderable}{$tplValue->orderableClass}{/if} {if $tplValue->class !== ''}{$tplValue->class}{/if}"
                                                    name="{$tplValue->name}">
                                                    <div class="lu-rail">
                                                        {if $rawObject->isvSortable()}
                                                            <span class="drag-and-drop-icon" style="visibility: hidden;"><i class="zmdi zmdi-unfold-more"></i></span>
                                                        {/if}
                                                        <div class="lu-form-check">
                                                            <label>
                                                                <input type="checkbox" data-check-all="" class="lu-form-checkbox">
                                                                <span class="lu-form-indicator"></span>
                                                            </label>
                                                        </div>
                                                        <span class="lu-table__text" {if $tplValue->orderable}v-on:click="updateSorting"{/if}>{if $tplValue->rawTitle}{$tplValue->rawTitle}{else}{$MGLANG->T('table', $tplValue->title)}{/if}</span>
                                                    </div>
                                                </th>
                                            {else}
                                                <th class="{if $tplValue->orderable}{$tplValue->orderableClass}{/if} {if $tplValue->class !== ''}{$tplValue->class}{/if}" {if $tplValue->orderable} aria-sort="descending" {/if}
                                                        {if $tplValue->orderable}v-on:click="updateSorting"{/if} name="{$tplValue->name}">
                                                    <span class="lu-table__text">{if $tplValue->rawTitle}{$tplValue->rawTitle}{else}{$MGLANG->T('table', $tplValue->title)}{/if}&nbsp;&nbsp;</span>
                                                </th>
                                            {/if}
                                        {/foreach}
                                        {if $rawObject->hasActionButtons()}
                                            <th class="mgTableActionsHeader" name="actionsCol"></th>
                                        {/if}
                                    </tr>
                                    </thead>
                                    <tbody {if $rawObject->isvSortable()}class="vSortable"{/if}>
                                    <tr v-for="dataRow in dataRows" :actionid="dataRow.id" :style="'cursor: pointer;'">
                                        {foreach from=$customTplVars.columns key=tplKey item=tplValue}
                                            {if $rawObject->hasMassActionButtons() && $collArrKeys[0] === $tplKey}
                                                <td>
                                                    <div class="lu-rail">
                                                        {if $rawObject->isvSortable()}
                                                            <span class="drag-and-drop-icon"><i class="lu-zmdi lu-zmdi-unfold-more"></i></span>
                                                        {/if}
                                                        <div class="lu-form-check">
                                                            <label>
                                                                <input type="checkbox" class="lu-form-checkbox table-mass-action-check" {literal}:value="dataRow.id"{/literal}>
                                                                <span class="lu-form-indicator"></span>
                                                            </label>
                                                        </div>
                                                        <span v-html="dataRow.{$tplKey}"></span>
                                                    </div>
                                                </td>
                                            {elseif $customTplVars.jsDrawFunctions[$tplKey]}
                                                <td v-html="rowDrow('{$tplKey}', dataRow, '{$customTplVars.jsDrawFunctions[$tplKey]}')"></td>
                                            {elseif $rawObject->hasCustomColumnHtml($tplKey)}
                                                <td class="mgTableActions">
                                                    {$rawObject->getCustomColumnHtml($tplKey)}
                                                </td>
                                            {else}
                                                <td v-html="dataRow.{$tplKey}"></td>
                                            {/if}
                                        {/foreach}
                                        {if $rawObject->hasActionButtons()}
                                            <td class="lu-cell-actions mgTableActions">
                                                {foreach $rawObject->getActionButtons() as $aButton}
                                                    {$aButton->getHtml()}
                                                {/foreach}
                                            </td>
                                        {/if}
                                    </tr>
                                    </tbody>
                                </table>
                                <div v-show="noData" style="padding: 15px; text-align: center;">
                                    {$MGLANG->absoluteT('noDataAvalible')}
                                </div>
                                <div class="lu-preloader-container lu-preloader-container--full-screen lu-preloader-container--overlay" v-show="loading">
                                    <div class="lu-preloader lu-preloader--sm"></div>
                                </div>
                            </div>
                            <div class="lu-t-c__footer table-footer">
                                <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">
                                    <a :class='"paginate_button previous" + ((curPage < 2) ? " disabled" : "")' aria-controls="DataTables_Table_0" :data-dt-idx='curPage -1' tabindex="0" href="javascript:;" page="prev" v-on:click="changePage" id="{$elementId}_previous"></a>
                                    <span v-for="pageNumber in pagesMap" >
                                        <a v-if='pageNumber && pageNumber !== "..."' :class='"paginate_button" + (curPage === pageNumber ? " current" : "")' aria-controls="DataTables_Table_0" v-on:click="changePage" :data-dt-idx="pageNumber" tabindex="0"> {{ pageNumber }} </a>
                                        <a v-if='pageNumber && pageNumber === "..."' class="paginate_button disabled" > {{ pageNumber }} </a>
                                    </span>
                                    <a :class='"paginate_button next" + ((curPage === allPages || allPages === 0) ? " disabled" : "")' aria-controls="DataTables_Table_0" :data-dt-idx='curPage +1' tabindex="0" href="javascript:;" page="next" v-on:click="changePage" id="{$elementId}_next"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
