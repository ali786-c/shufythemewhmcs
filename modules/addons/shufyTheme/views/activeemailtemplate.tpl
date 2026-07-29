
<div style="margin-bottom: 30px" class="liecense__checker__container">
	<div class="liecense__checker__body">
	<i class="fal fa-file-certificate lisencecheck_primary_icon"></i>
	<h5 class="title text-center">Activate Shufytheme email template extension</h5>
	
	{if $smarty.get.success|default:'' == 1}
	<div class="alert alert-success">
		<strong>Success!</strong> Your email template extension has been activated successfully.
	</div>
	{/if}

	{if $smarty.get.error|default:'' == 2}
	<div class="alert alert-danger" role="alert">
	  <h4 class="alert-heading">Envato Purchase Code is Invalid or Used!</h4>
	  <p>Your purchase code is invalid! Plugin is not activated! Check your code â€“ maybe itâ€™s from another theme or your purchase code was previously used</p>
	  <hr>
	  <p>The plugin is not activated! If you feel you received this message by mistake, Please contact our <a target="_blank" href="https://coodiv.net/support">Support team</a> or you can try to enter your <a href="{$modurl}&action=lisence">Purchase Code again</a> before that please check that :</p>
	  <br>
	  <ul>
	  <li>Envato Purchase Code is correct, <a href="https://help.market.envato.com/hc/en-us/articles/202822600-Where-Is-My-Purchase-Code" target="_blank">Where Is My Purchase Code?</a></li>
	  <li>The Purchase Code is not Used on a Different Site</li>
	  <li>The Number of Allowed Activation Attempts was not Exceeded</li>
	  </ul>
	</div>
	{/if}
	
	{if $smarty.get.error|default:'' == 4}
	<div class="alert alert-danger">
		<strong>Check the extension file!</strong> Something went wrong with the extension file. Please try again or check your extension file.
	</div>
	{/if}
	
	{if $smarty.get.error|default:'' == 1}
	<div class="alert alert-danger">
		<strong>Error saving in database!</strong> Something went wrong. Please try again or check your purchase code.
	</div>
	{/if}
	
	<p>ShufyTheme Email Template provides a modern, clean, and fully responsive design for all WHMCS system emails. It enhances readability, improves branding, and ensures consistent styling across all client communications. The template is easy to customize, supports WHMCS merge fields, and works seamlessly with all ShufyTheme features.</p>
	<form action="{$modurl}&action=sendemailtemplatelisence" method="post" id="verify-envato-purchase">
	<div class="form-group">
	<label for="template">Please activate this extension before you can start using its features. During the activation, you will need to use the Envato purchase code for the Shufytheme email template extension <strong><a href="https://help.market.envato.com/hc/en-us/articles/202822600-Where-Is-My-Purchase-Code" target="_blank">Where Is My Purchase Code?</a></strong> <i data-toggle="tooltip" data-placement="bottom" title="You need a License certificate & purchase code from ThemeForest to make this extention work." class="fas fa-info-circle"></i></label>
	<input type="text" name="purchase_code" value="" class="form-control" id="input-purchase-code" placeholder="Enter Shufytheme email template Purchase Code" required />
	</div>
	

	<input type="submit" value="Verify Purchase" class="add__liecense__btn">
	</form>
	</div>
	<p class="copyright">Copyright &copy; <a href="https://coodiv.net/" target="_blank">Coodiv</a> {date('Y')}.All Rights Reserved.</p>
</div>






			  
