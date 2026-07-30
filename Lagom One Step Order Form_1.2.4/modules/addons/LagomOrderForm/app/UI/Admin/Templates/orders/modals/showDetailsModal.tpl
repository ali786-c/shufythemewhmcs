{**********************************************************************
* ProxmoxAddon product developed. (2017-11-16)
* *
*
*  CREATED BY MODULESGARDEN       ->       http://modulesgarden.com
*  CONTACT                        ->       contact@modulesgarden.com
*
*
* This software is furnished under a license and may be used and copied
* only  in  accordance  with  the  terms  of such  license and with the
* inclusion of the above copyright notice.  This software  or any other
* copies thereof may not be provided or otherwise made available to any
* other person.  No title to and  ownership of the  software is  hereby
* transferred.
*
*
**********************************************************************}

{**
* @author Sławomir Miśkowicz <slawomir@modulesgarden.com>
*}
<div class="lu-modal show lu-modal--{$rawObject->getModalSize()}" id="confirmationModal"
     namespace="{$rawObject->getNamespace()}" index="{$rawObject->getId()}">
    <div class="lu-modal__dialog">
        <div class="lu-modal__content" id="mgModalContainer">
            <div class="lu-modal__top lu-top">
                <div class="lu-top__title lu-type-6">
                    <span class="lu-text-faded lu-font-weight-normal">
                {if $rawObject->isRawTitle()}{$rawObject->getRawTitle()}{elseif $rawObject->getTitle()}{$MGLANG->T('modal', $rawObject->getTitle())}{/if}
            </span>
                </div>
                <div class="lu-top__toolbar">
                    <button class="lu-btn lu-btn--xs lu-btn--default lu-btn--icon lu-btn--link lu-btn--plain closeModal"
                            data-dismiss="lu-modal" aria-label="Close" @click='closeModal($event)'>
                        <i class="lu-btn__icon lu-zmdi lu-zmdi-close"></i>
                    </button>
                </div>
            </div>
            <div class="lu-modal__body">
                <div class="lu-col-md-12">
                        <table class="lu-table lu-table-hover">
                            <thead>
                            <tr>
                                <th>{$MGLANG->T('modal','fieldName')}</th>
                                <th>{$MGLANG->T('modal','type')}</th>
                                <th>{$MGLANG->T('modal','fieldValue')}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$customTplVars.fields item=field}
                                <tr>
                                    <td>{html_entity_decode($field->name)}</td>
                                    <td>{$MGLANG->absoluteT($field->type)}</td>
                                    <td>{$field->value} </td>
                                </tr>
                                {foreachelse}
                                <tr>
                                    <td colspan="3"
                                        style="text-align: center;">{$MGLANG->T('modal','No Fields')}</td>
                                </tr>
                            {/foreach}
                            </tbody>
                        </table>
                </div>
            </div>
            <div class="lu-modal__actions">
                {foreach from=$rawObject->getActionButtons() item=actionButton}
                    {$actionButton->getHtml()}
                {/foreach}
            </div>
            {if ($isDebug eq true AND (count($MGLANG->getMissingLangs()) != 0))}{literal}
                <div class="lu-modal__actions">
                <div class="lu-row">
            {/literal}{foreach from=$MGLANG->getMissingLangs() key=varible item=value}{literal}
                <div class="lu-col-md-12"><b>{/literal}{$varible}{literal}</b> = '{/literal}{$value}{literal}';</div>
            {/literal}{/foreach}{literal}
                </div>
                </div>
            {/literal}{/if}
        </div>
    </div>
</div>
