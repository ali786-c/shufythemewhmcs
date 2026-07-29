{if $smarty.get.success|default:'' == 1}
<div class="settings__popupalert__coodiv alert alert-success alert-dismissible show" role="alert">
  <span class="alert__progress"></span>
  <span class="icon"><i class="fal fa-check-circle"></i></span>
  <div class="text">
  <strong>Success!</strong> Shufytheme menu settings options has been saved successfully.
  </div>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	<span aria-hidden="true">&times;</span>
  </button>
</div>
{/if}


<div class="coodiv__main__hero with__menu">
	<div class="coodiv__main__hero__breadcrumbs">{$breadcrumbs}</div>
	<div class="row justify-content-between">
		<div class="col-md-5 col-12">
		
			<h5 class="coodiv__main__hero__title">Shufy Theme {$groupinfo.name|default:''} Menu list</h5>
			<p class="coodiv__main__hero__sub__title">You do not need to create complicated WHMCS hooks to create or edit menus anymore, Coodiv Primary Menu manager gives you convenient options to set up your theme main navigation.</p>
		</div>
		<div class="col-md-7 col-12 btn__container">
			<a href="{$modurl}&action=additem&groupid={$groupinfo.id|default:''}" class="add__new__group__btn"><i class="fal fa-plus"></i>Add new item</a>
		</div>
	</div>

	<ul class="navbar-nav coodiv__main__hero__nav">
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themeoption">Genaral</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=styleoptions">Colors</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=typpoptions">Typography</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=layoutoptions">Layouts</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=sidebaroptions">Sidebar</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=footeroptions">Footer</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=homepageoptions">Homepage</a></li>
	  <li class="nav-item active"><a class="nav-link">Menus</a></li> 
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=settingsbackups">Backups</a></li>
	  <li class="nav-item"><a class="nav-link" href="{$modurl}&action=themehealthcheck">Health</a></li>
	  
	  <li class="nav-item ml-auto"><a href="{$modurl}&action=extentions" class="nav-link">Extention manager</a></li>
	</ul>
</div>

<div class="menu__listitems__wrapper shufytheme__menu__manager" data-menu-sortable data-group-id="{$groupinfo.id|default:''}" data-reorder-url="{$modurl}&action=reorder">
	<div class="shufytheme__menu__manager__toolbar">
		<div>
			<strong>Menu Structure</strong>
			<span>Click Up, Down, Make Child, or Move Out to arrange menu items. Changes save automatically.</span>
		</div>
		<div class="shufytheme__menu__manager__status" data-menu-sortable-status>
			<i class="fal fa-check-circle"></i>
			<span>Order is up to date</span>
		</div>
	</div>
	<div class="released__table shufytheme__menu__sortable__table">
		<div class="released__row shufytheme__menu__sortable__head">
			<div class="released__col">Title</div>
			<div class="released__col">Display Rule</div>
			<div class="released__col target">Target Blank</div>
			<div class="released__col"></div>
		</div>

		{function name=parsemenuchildren menuitems=$items depth=1}
		<ol class="shufytheme__menu__sortable__list depth__{$depth}" data-menu-sortable-list data-depth="{$depth}">
			{foreach item=item from=$menuitems}
			<li class="shufytheme__menu__sortable__item depth__{$depth}" data-menu-item-id="{$item.id|default:''}">
				<div class="released__row shufytheme__menu__sortable__row">
					<div class="released__col menu__title">
						<span class="shufytheme__menu__level__badge">L{$depth}</span>
						<span class="shufytheme__menu__item__title">{$item.title|default:''}</span>
					</div>
					<div class="released__col">
						{if $item.accesslevel|default:''=='1'}
						<span class="label level__1">Always Active</span>
						{else if $item.accesslevel|default:''=='2'}
						<span class="label level__2">Active for Guest Only</span>
						{else if $item.accesslevel|default:''=='3'}
						<span class="label level__3">Active for Client Only</span>
						{else}
						<span class="label">Rule {$item.accesslevel|default:'-'}</span>
						{/if}
					</div>
					<div class="released__col target">
						{if $item.targetwindow|default:''=='_blank'}
						<span class="label enabled">Enabled</span>
						{else if $item.targetwindow|default:''=='_self'}
						<span class="label disabled">Disabled</span>
						{/if}
					</div>
					<div class="released__col">
						<a href="{$modurl}&action=edititem&itemid={$item.id|default:''}" class="btn__manage__menu">Manage menu</a>
					</div>
				</div>
				{assign var=nextDepth value=$depth+1}
				{parsemenuchildren menuitems=$item.children|default:'' depth=$nextDepth}
			</li>
			{/foreach}
		</ol>
		{/function}
		{parsemenuchildren menuitems=$items depth=1}
	</div>
</div>


{if $countitems=='0'}
<div class="alert alert-warning" role="alert">
	<h4 class="alert-heading">No Menu Items Created !</h4>
	<p>Please <a href="{$modurl}&action=additem&groupid={$groupinfo.id|default:''}">Add New Menu Items</a>, or follow our <a href="https://emyui.coodiv.net/documentation/" target="_blank" href="#">documentation</a> if need more information.</p>
</div>
{/if} 
</div>


								 




