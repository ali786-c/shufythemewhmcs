"use strict";

$(document).ready(function(){
    var URITYPE = $('select[name="urltype"]');
        URITYPE.on("change", function(){
            $('[name="clientarea-off"],[name="customurl"]').hide();
            $('[name="'+this.value+'"]').show();
        });
    $('[data-toggle="tooltip"]').tooltip();
});


$(document).ready(function(){
    var radiothemesetting = $('input[name="dafaultthemecolor"]');
        radiothemesetting.on("change", function(){
			if ($(this).val() == "theme-style-one") {
				$('#custom-colors-schemes-one').addClass("d-block").removeClass("d-none");
				$('#custom-colors-schemes-two').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-three').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-four').addClass("d-none").removeClass("d-block");
			} else if ($(this).val() == "theme-style-two") {
				$('#custom-colors-schemes-one').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-two').addClass("d-block").removeClass("d-none");
				$('#custom-colors-schemes-three').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-four').addClass("d-none").removeClass("d-block");
			} else if ($(this).val() == "theme-style-three") {
				$('#custom-colors-schemes-one').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-two').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-three').addClass("d-block").removeClass("d-none");
				$('#custom-colors-schemes-four').addClass("d-none").removeClass("d-block");
			} else if ($(this).val() == "theme-style-four") {
				$('#custom-colors-schemes-one').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-two').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-three').addClass("d-none").removeClass("d-block");
				$('#custom-colors-schemes-four').addClass("d-block").removeClass("d-none");
			}
        });
});

$(document).ready(function(){
    var manager = $('[data-menu-sortable]');
    if (!manager.length) {
        return;
    }

    var maxDepth = 3;
    var saveTimer = null;

    function menuStatus(type, message) {
        var status = manager.find('[data-menu-sortable-status]');
        var icon = status.find('i');
        status.removeClass('is-saving is-error is-success');
        if (type) {
            status.addClass('is-' + type);
        }
        icon.attr('class', type === 'error' ? 'fal fa-times-circle' : (type === 'saving' ? 'fal fa-spinner fa-spin' : 'fal fa-check-circle'));
        status.find('span').text(message);
    }

    function showMenuAlert(type, message) {
        var icon = type === 'success' ? 'fal fa-check-circle' : 'fal fa-times-circle';
        var title = type === 'success' ? 'Success!' : 'Error!';
        var alertClass = type === 'success' ? 'alert-success' : 'alert-danger';
        var safeMessage = $('<div>').text(message).html();
        var alertHtml = '<div class="settings__popupalert__coodiv alert ' + alertClass + ' alert-dismissible show" role="alert">'
            + '<span class="alert__progress"></span>'
            + '<span class="icon"><i class="' + icon + '"></i></span>'
            + '<div class="text"><strong>' + title + '</strong> ' + safeMessage + '</div>'
            + '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>'
            + '</div>';

        $('.settings__popupalert__coodiv').remove();
        $('.coodiv__whmcs__admin__panel__main__wrapper .container-fluid').first().prepend(alertHtml);
    }

    function listDepth(list) {
        return parseInt($(list).attr('data-depth') || '1', 10) || 1;
    }

    function subtreeDepth(item) {
        var max = 1;
        $(item).children('[data-menu-sortable-list]').children('[data-menu-item-id]').each(function(){
            max = Math.max(max, 1 + subtreeDepth(this));
        });
        return max;
    }

    function canPlaceInList(item, list) {
        return listDepth(list) + subtreeDepth(item) - 1 <= maxDepth;
    }

    function ensureMenuQuickActions() {
        manager.find('[data-menu-item-id]').each(function(){
            var row = $(this).children('.shufytheme__menu__sortable__row').first();
            var actionsColumn = row.children('.released__col').last();
            if (!row.length || !actionsColumn.length || actionsColumn.children('.shufytheme__menu__quickactions').length) {
                return;
            }

            actionsColumn.prepend(
                '<div class="shufytheme__menu__quickactions">'
                    + '<button type="button" data-menu-action="up" title="Move up"><i class="fal fa-arrow-up"></i><span>Up</span></button>'
                    + '<button type="button" data-menu-action="down" title="Move down"><i class="fal fa-arrow-down"></i><span>Down</span></button>'
                    + '<button type="button" data-menu-action="child" title="Make child of the item above"><i class="fal fa-level-down-alt"></i><span>Make Child</span></button>'
                    + '<button type="button" data-menu-action="out" title="Move out one level"><i class="fal fa-level-up-alt"></i><span>Move Out</span></button>'
                + '</div>'
            );
        });
        updateMenuQuickActionStates();
    }

    function updateMenuQuickActionStates() {
        manager.find('[data-menu-item-id]').each(function(){
            var item = $(this);
            var actions = item.children('.shufytheme__menu__sortable__row').first()
                .children('.released__col').last()
                .children('.shufytheme__menu__quickactions');
            var previousItem = item.prev('[data-menu-item-id]');
            var nextItem = item.next('[data-menu-item-id]');
            var childList = previousItem.children('[data-menu-sortable-list]').first()[0];
            var parentItem = item.parent('[data-menu-sortable-list]').parent('[data-menu-item-id]');
            var canBecomeChild = previousItem.length && childList && canPlaceInList(item[0], childList);

            actions.find('[data-menu-action="up"]').prop('disabled', !previousItem.length);
            actions.find('[data-menu-action="down"]').prop('disabled', !nextItem.length);
            actions.find('[data-menu-action="child"]').prop('disabled', !canBecomeChild);
            actions.find('[data-menu-action="out"]').prop('disabled', !parentItem.length);
        });
    }

    function applyMenuAction(itemElement, action) {
        var item = $(itemElement);
        var targetList = item.parent('[data-menu-sortable-list]')[0];
        var moved = false;

        if (!item.length || !targetList) {
            return false;
        }

        if (action === 'up') {
            var previousItem = item.prev('[data-menu-item-id]');
            if (!previousItem.length) {
                menuStatus('error', 'This item is already first in this level.');
                return false;
            }
            item.insertBefore(previousItem);
            moved = true;
        } else if (action === 'down') {
            var nextItem = item.next('[data-menu-item-id]');
            if (!nextItem.length) {
                menuStatus('error', 'This item is already last in this level.');
                return false;
            }
            item.insertAfter(nextItem);
            moved = true;
        } else if (action === 'child') {
            var parentCandidate = item.prev('[data-menu-item-id]');
            if (!parentCandidate.length) {
                menuStatus('error', 'Move this item below another item first, then click Child.');
                return false;
            }
            var childList = parentCandidate.children('[data-menu-sortable-list]').first()[0];
            if (!childList || !canPlaceInList(item[0], childList)) {
                menuStatus('error', 'Second child is the deepest supported menu level.');
                return false;
            }
            childList.appendChild(item[0]);
            moved = true;
        } else if (action === 'out') {
            var parentItem = item.parent('[data-menu-sortable-list]').parent('[data-menu-item-id]');
            if (!parentItem.length) {
                menuStatus('error', 'This item is already a top menu item.');
                return false;
            }
            var parentList = parentItem.parent('[data-menu-sortable-list]')[0];
            if (!parentList || !canPlaceInList(item[0], parentList)) {
                menuStatus('error', 'This item can not be moved out from this level.');
                return false;
            }
            item.insertAfter(parentItem);
            moved = true;
        } else {
            return false;
        }

        if (moved) {
            refreshDepths(rootMenuList(), 1);
            ensureMenuQuickActions();
            updateMenuQuickActionStates();
            menuStatus('saving', 'Saving menu order...');
            saveMenuOrder();
        }
        return moved;
    }

    function refreshDepths(list, depth) {
        $(list).attr('data-depth', depth).removeClass('depth__1 depth__2 depth__3').addClass('depth__' + depth);
        $(list).children('[data-menu-item-id]').each(function(){
            var item = $(this);
            item.removeClass('depth__1 depth__2 depth__3').addClass('depth__' + depth);
            item.find('> .shufytheme__menu__sortable__row .shufytheme__menu__level__badge').text('L' + depth);
            var childList = item.children('[data-menu-sortable-list]').first();
            if (childList.length) {
                refreshDepths(childList, depth + 1);
            }
        });
        updateMenuQuickActionStates();
    }

    function serializeList(list) {
        var items = [];
        $(list).children('[data-menu-item-id]').each(function(){
            var item = $(this);
            items.push({
                id: parseInt(item.attr('data-menu-item-id'), 10),
                children: serializeList(item.children('[data-menu-sortable-list]').first())
            });
        });
        return items;
    }

    function rootMenuList() {
        var directRoot = manager.children('.released__table').children('[data-menu-sortable-list]').first();
        if (directRoot.length) {
            return directRoot;
        }

        return manager.find('[data-menu-sortable-list][data-depth="1"]').first();
    }

    function encodeMenuPayload(value) {
        return window.btoa(unescape(encodeURIComponent(value)));
    }

    function saveMenuOrder() {
        window.clearTimeout(saveTimer);
        saveTimer = window.setTimeout(function(){
            var rootList = rootMenuList();
            var serializedItems = serializeList(rootList);
            if (!rootList.length || serializedItems.length === 0) {
                menuStatus('error', 'Menu order could not be saved because the menu structure was not detected.');
                showMenuAlert('error', 'Menu order could not be saved because the menu structure was not detected. Please refresh the page and try again.');
                return;
            }
            menuStatus('saving', 'Saving menu order...');
            $.ajax({
                url: manager.attr('data-reorder-url'),
                type: 'POST',
                dataType: 'json',
                data: {
                    groupid: manager.attr('data-group-id'),
                    items_json: JSON.stringify(serializedItems),
                    items_payload: encodeMenuPayload(JSON.stringify(serializedItems))
                }
            }).done(function(response){
                if (response && response.success) {
                    menuStatus('success', response.message || 'Menu order saved.');
                    return;
                }
                var message = response && response.message ? response.message : 'Menu order could not be saved.';
                menuStatus('error', message);
                showMenuAlert('error', message);
            }).fail(function(xhr){
                var message = 'Menu order could not be saved. Please try again.';
                if (xhr && xhr.responseJSON && xhr.responseJSON.message) {
                    message = xhr.responseJSON.message;
                }
                menuStatus('error', message);
                showMenuAlert('error', message);
            });
        }, 250);
    }

    manager.on('click', '[data-menu-action]', function(event){
        event.preventDefault();
        if (this.disabled) {
            return;
        }
        applyMenuAction($(this).closest('[data-menu-item-id]', manager)[0], String($(this).attr('data-menu-action') || ''));
    });

    ensureMenuQuickActions();
    updateMenuQuickActionStates();
});








