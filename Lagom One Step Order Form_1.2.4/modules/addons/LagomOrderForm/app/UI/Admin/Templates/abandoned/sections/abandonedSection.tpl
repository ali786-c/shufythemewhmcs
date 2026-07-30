<div class="lu-block">
    <div class="lu-block__body">
        <div class="lu-widget">
            <div class="lu-widget__body">
                <div class="lu-t-c" data-table-container>
                    <div class="lu-t-c__top lu-top lu-mob-top-search">
                        <div class="lu-top__toolbar">
                            <div class="lu-top__search lu-input-group">
                                <span class="lu-icon-sm lu-input-group__icon">
                                    <i class="lu-zmdi lu-zmdi-search "></i>
                                </span>
                                <input class="lu-form-control lu-input-group__form-control lu-table-search" value="" placeholder="search..." id="table-search">
                            </div>
                        </div>
                        <div class="lu-top__toolbar">
                        </div>
                    </div>
                    <table class="lu-table lu-table--mob-collapsible hidden" data-data-table data-options="tableSearch: #table-search; isRespnsive: true;">
                        <colgroup>
                            <col style="width: 17%"/>
                            <col style="width: 13%"/>
                            <col style="width: 21%"/>
                            <col style="width: 19%;"/>
                            <col style="width: 17%;"/>
                            <col style="width: 13%"/>                            
                            <col style="width: 0%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>
                                    <span class="lu-table__text">Client</span>
                                </th>                                
                                <th>
                                    <span class="lu-table__text">Price</span>
                                </th>
                                <th>
                                    <span class="lu-table__text">Date</span>
                                </th>
                                <th>
                                    <span class="lu-table__text">Template Settings</span>
                                </th>
                                <th>
                                    <span class="lu-table__text">Order Time</span>
                                </th>
                                <th>
                                    <span class="lu-table__text">Exit Intent Modal</span>
                                </th>
                                <th class="lu-no-sort"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td data-label="Client">
                                    <span class="lu-btn lu-btn--icon lu-btn--link" data-show-all>
                                        <i class="lu-btn__icon lu-zmdi lu-zmdi-chevron-down" data-show-all-icon></i>
                                    </span>
                                    <a href="#">Paweł Bis</a>
                                </td>                              
                                <td data-label="Price">
                                    $268.54
                                </td>
                                <td data-label="Date">
                                    21st of January 2020
                                </td>
                                <td data-label="Template Settings">
                                    One Step, Bottom
                                </td>
                                <td data-label="Order Time">
                                    00:00:10
                                </td>
                                <td data-label="Exit Intent Modal">
                                    <span class="lu-label lu-label--success lu-label--status">Submited</span>
                                </td>
                                <td class="lu-cell-actions">
                                    <button type="button" class="lu-btn lu-btn--icon lu-btn--link"><i class="lu-btn__icon lu-zmdi lu-zmdi-email"></i></button>
                                </td>
                           </tr>     
                           <tr>
                                <td data-label="Client">
                                    <span class="lu-btn lu-btn--icon lu-btn--link" data-show-all>
                                        <i class="lu-btn__icon lu-zmdi lu-zmdi-chevron-down" data-show-all-icon></i>
                                    </span>
                                    <a href="#">Paweł Bis</a>
                                </td>                              
                                <td data-label="Price">
                                    $268.54
                                </td>
                                <td data-label="Date">
                                    21st of January 2020
                                </td>
                                <td data-label="Template Settings">
                                    One Step, Bottom
                                </td>
                                <td data-label="Order Time">
                                    00:00:10
                                </td>
                                <td data-label="Exit Intent Modal">
                                    <span class="lu-label lu-label--danger lu-label--status">Closed</span>
                                </td>
                                <td class="lu-cell-actions">
                                    <button type="button" class="lu-btn lu-btn--icon lu-btn--link"><i class="lu-btn__icon lu-zmdi lu-zmdi-email"></i></button>
                                </td>
                           </tr>     
                        </tbody>
                    </table>       
                    <div class="lu-preloader-container" data-table-preloader>
                        <div class="lu-preloader"></div>
                    </div>
                </div> 
            </div>
        </div>
    </div>    
    <div class="lu-block__sidebar lu-block__sidebar--lg">
        <div class="lu-widget">
            <div class="lu-widget__header">
                <div class="lu-widget__top lu-top">
                    <div class="lu-top__title">Settings</div>
                </div>
            </div>
            <div class="lu-widget__body">
                <div class="lu-widget__content">
                    <div class="lu-form-check lu-m-b-2x">
                        <label>
                            <span class="lu-form-text">Enable tracking for non exisitng customers</span>
                            <div class="lu-switch">
                                <input class="lu-switch__checkbox" type="checkbox" checked>
                                <span class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    <div class="lu-form-check lu-m-b-2x">
                        <label>
                            <span class="lu-form-text">Enable abandoned cart emails</span>
                            <div class="lu-switch">
                                <input class="lu-switch__checkbox" type="checkbox">
                                <span class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    <div class="lu-form-check">
                        <label>
                            <span class="lu-form-text">Enable exit intent modal</span>
                            <div class="lu-switch">
                                <input class="lu-switch__checkbox" type="checkbox">
                                <span class="lu-switch__container"><span class="lu-switch__handle"></span></span>
                            </div>
                        </label>
                    </div>
                    <div class="lu-form-group lu-form-group--horizontal lu-m-t-2x">
                        <label class="lu-m-b-0x">Cart abandoned cut-off time</label>
                        <div class="lu-input-group lu-input-group--sm lu-is-right lu-m-r-0x">
                            <input type="text" value="30" size="1" class="lu-form-control"> 
                            <span class="lu-input-group__addon">min</span>
                        </div>
                    </div>
                </div>  
            </div>    
            <div class="lu-widget__actions lu-widget__actions--raised">
                <button type="button" class="lu-btn lu-btn--success"><span class="lu-btn__text">Save Changes</span></button>
            </div>    
        </div>    
    </div>    
</div>