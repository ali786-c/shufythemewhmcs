
const LagomOrderFormContainer = {
    integrationTarget: null,
    containerId: null
};

let mainGroupsPosition = 0
let slidersArr = []
let isPageRTL = $('html').attr('dir') == 'rtl' ? true : false

// var origScrollLeft = jQuery.fn.scrollLeft;
// jQuery.fn.scrollLeft = function(i) {
//     var value = origScrollLeft.apply(this, arguments);

//     if (i === undefined) {
//         switch(jQuery.support.rtlScrollType) {
//             case "negative":
//                 return value + this[0].scrollWidth - this[0].clientWidth;
//             case "reverse":
//                 return this[0].scrollWidth - value - this[0].clientWidth;
//         }
//     }

//     return value;
// };

/**
 *
 * @description allow to render iCheck elements
 * @param component
 * @param onCheck
 * @param unCheck
 */
function renderCheckBox(component, onCheck = () => {}, unCheck = () => {})
{
    var checkboxes = $('#'+component).find('input.icheck-control:not(.icheck-input):not(.switch__checkbox), .addon-selector');
    checkboxes.iCheck({
        checkboxClass:  'checkbox-styled',
        radioClass:     'radio-styled',
        increaseArea:   '40%'
    });
    checkboxes.on('ifChecked', function (e) {
        onCheck($(this).val());
    });

    checkboxes.on('ifUnchecked', function (e) {
        unCheck($(this).val());
    });
};

/**
 *
 */
function renderFixedElements()
{
    $('[data-fixed-actions]').luScrollTo({
        onScreen: function onScreen(element, target) {
            $(element).stop().removeClass('is-fixed');
        },
        outScreen: function outScreen(element, target) {
            $(element).stop().addClass('is-fixed');
        }
    });
};

/**
 *
 */
function renderSectionIndex()
{
    var a = 1;
    $('.section-number').each(function(){
        $(this).text(a);
        a = a +1;
    })
};

function addOrderIntegration(integrationTarget, contId, appContainer)
{
    LagomOrderFormContainer.containerId       = contId;
    LagomOrderFormContainer.integrationTarget = integrationTarget;

    const mgIntegration = jQuery('#'+contId);
    const container     = $(integrationTarget);

    container.append('<div class="vue-app-main-container" id='+ contId +' hidden>' + mgIntegration[0].innerHTML + '</div>');
    appContainer.remove();
}

function renderNavScroll(){
    $('[data-nav-tabs-container]').each((singleNavContainerIndex, singleNavContainer) => {
        setTimeout(function() {
            navScroll($(singleNavContainer), singleNavContainerIndex);
            navScrollControl($(singleNavContainer), singleNavContainerIndex);
        }, 1)
    
        $(window).on('resize', function(){
            navScroll($(singleNavContainer), singleNavContainerIndex)
        });
    })
}

function navScroll(container, index){
    let header = container;

    let nav = $(container).find('[data-nav]')
    let navWidth = nav.width();
    let navChildren = $(container).find('.nav-tabs li:not(.nav-arrow)');
    let navChildrenWidth = 0;

    navChildren.each(function(){
        navChildrenWidth += $(this).outerWidth(true); 
    });

    setTimeout(function() {
        $('[data-toggle="tooltip"]').tooltip({
            boundary: 'window'
        })
        if(isPageRTL) {
            if (navWidth + nav.scrollLeft() + 5 <= navChildrenWidth){
                $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                if(nav.scrollLeft() < 5) {
                    $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
                header.addClass('has-scroll');
            }
            else{
                header.removeClass('has-scroll');
                $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
                $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
            }
            if(nav.scrollLeft() > 5) {
                $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
            }
        }
        else {
            if (navWidth + nav.scrollLeft() + 5 <= navChildrenWidth){

                $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                if(nav.scrollLeft() < 5) {
                    $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
                header.addClass('has-scroll');
            }
            else{
                header.removeClass('has-scroll');
                $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
                $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
            }
            if(nav.scrollLeft() > 5) {
                $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
            }
        }
    }, 10)
}
function navScrollControl(container, index){
    let nav = $(container).find('[data-nav]');
    let position = null;

    if(index == 0 && $(container).find('.nav-item.active').length) {
        positionLeft = $(container).find('.nav-item.active').position().left
        if(positionLeft < 5) {
            position = 0
        }
        else {
            position = $(container).find('.nav-item.active').position().left - 32
        }

        nav.scrollLeft(position)
    }
    else {

        position = nav.scrollLeft();
    }

    let navTabsOuterWidth = $(container).find('.nav-tabs').outerWidth(true)
    let navChildren = $(container).find('.nav-tabs li:not(.nav-arrow)')
    let navChildrenWidth = 0;
    navChildren.each(function(){
        navChildrenWidth += $(this).outerWidth(true); 
    });

    $(container).find('[data-scrollnav]').on('click', function(e){
        e.preventDefault();
        navChildrenWidth = 0;
        navChildren.each(function(){
            navChildrenWidth += $(this).outerWidth(true); 
        });
        
        let direction = $(this).data('scrollnav');
        // if(isPageRTL) {
            // position -= direction
        // }
        // else {
            position += direction
        // }

        
        if(isPageRTL) {
            // if(position < navChildrenWidth) {
            //     position = navChildrenWidth
            // }
            // else if(position > 0) {
            //     position = 0;
            // }
            if(position > 0) {
                position = 0;
            }
        }
        else {
            if(position > navChildrenWidth) {
                position = navChildrenWidth
            }
            else if(position < 0) {
                position = 0;
            }
        }
        if(isPageRTL) {
            position += direction
        }

        let button = $(this);
        mainGroupsPosition = position
        button.addClass('disabled');

        nav.animate({scrollLeft: position}, 200).promise().done(function(){
            mainGroupsPosition = position
            button.removeClass('disabled');
        });
    });
    
    let navItemsWidth = 0;

    $(container).find('.nav-tabs .nav-item').each((index, item) => {
        navItemsWidth += $(item).outerWidth(true)
    })

    $(container).find('.nav-tabs').scroll(function() {
        if($(container).find('.nav-tabs').scrollLeft()) {
            position = $(container).find('.nav-tabs').scrollLeft()
        }
        mainGroupsPosition = position
        setTimeout(function() {
            if(isPageRTL) {
                if(position > -15 || $(container).find('.nav-tabs').scrollLeft() > -7) {
                    $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
                else if(position - navTabsOuterWidth - 15 <= -navItemsWidth) {
                    $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
                slidersArr[index] = {
                    position, 
                    navItemsWidth,
                    mainGroupsPosition,
                    scrollLeft: position - navTabsOuterWidth
                }
            }
            else {
                if(position < 5 || $(container).find('.nav-tabs').scrollLeft() < 7) {
                    $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
                else if(position + navTabsOuterWidth + 15 >= navItemsWidth) {
                    $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
                slidersArr[index] = {
                    position, 
                    navItemsWidth,
                    mainGroupsPosition,
                    scrollLeft: position + navTabsOuterWidth
                }
            }

        }, 10)
    })

    $(window).on('resize', function() {
        if($(container).find('.nav-tabs').scrollLeft()) {
            position = $(container).find('.nav-tabs').scrollLeft()
        }
        
        navChildren = $(container).find('.nav-tabs li:not(.nav-arrow)')
        navChildrenWidth = 0;
        navChildren.each(function(){
            navChildrenWidth += $(this).outerWidth(true); 
        });
        navTabsOuterWidth = $(container).find('.nav-tabs').outerWidth(true)

        navItemsWidth = 0;

        $(container).find('.nav-tabs .nav-item').each((index, item) => {
            navItemsWidth += $(item).outerWidth(true)
        })

        if(isPageRTL) {
            if(position == 0) {
                $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
            }
            else if(position - navTabsOuterWidth - 5 <= navItemsWidth) {
                $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
            }
            else {
                $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
            }
        }
        else {
            if(position == 0) {
                $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
            }
            else if(position + navTabsOuterWidth + 5 >= navItemsWidth) {
                $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
            }
            else {
                $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
            }
        }

    })

    $(container).find('.nav-tabs .nav-item').on('click', function(e) {
        let clickedElement = null;
        if(e.target.getAttribute('href')) {
            clickedElement = e.target
        }
        else {
            clickedElement = $(e.target).closest('a')
        }
        let rightPosition = isPageRTL ? ($(container).width() - ($(clickedElement).position().left + $(clickedElement).width()) - $(container).find('.nav-tabs').width() + 1) : ($(clickedElement).position().left - $(container).find('.nav-tabs').width() + 1)
        let leftPosition = $(clickedElement).position().left
        let rightScroll = ($(clickedElement).outerWidth(true) + rightPosition) * -1
        if(isPageRTL) {
            if(leftPosition < 16) {
                position -= leftPosition + 32
                if(position >= -40) {
                    position = 0
                }
                if(position < -40) {
                    $(container).find('.nav-arrow--right').addClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
    
                nav.animate({scrollLeft: position}, 100).promise().done(function(){mainGroupsPosition = position});
            }
            else if (rightScroll < -5) {
                position -= (rightScroll * -1) - 32
                // if()
                if(position < -40) {
                    $(container).find('.nav-arrow--right').removeClass('nav-arrow--hidden')
                }
                nav.animate({scrollLeft: position}, 200).promise().done(function(){mainGroupsPosition = position});
            }
        }
        else {
            if(leftPosition < 16) {
                position += leftPosition - 32
                if(position <= 40) {
                    position = 0
                }
                if(position < 40) {
                    $(container).find('.nav-arrow--left').addClass('nav-arrow--hidden')
                }
                else {
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
    
                nav.animate({scrollLeft: position}, 100).promise().done(function(){mainGroupsPosition = position});
            }
            else if (rightScroll < -5) {
                position += (rightScroll * -1) + 32
                if(position > 40) {
                    $(container).find('.nav-arrow--left').removeClass('nav-arrow--hidden')
                }
                nav.animate({scrollLeft: position}, 200).promise().done(function(){mainGroupsPosition = position});
            }
        }
    })
}