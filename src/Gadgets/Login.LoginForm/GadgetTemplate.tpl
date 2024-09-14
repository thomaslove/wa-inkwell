<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>
<$if(!Model.IsHiddenOnPage)$>
<$if(Model.Security.IsAuthenticated && !Model.IsSitePreviewMode)$>
<div class="loginContainerAuthenticated orientation<$Model.Settings.Layout$>">
  <div class="loggedName"><$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$></div>
  <$if (!Model.IsSystemAdminView)$>
  <div class="profileBox viewProfileBox">
    <a href=<$if (Model.IsAdminView)$>"<$Model.Urls.ContactDetails$>" target="_blank"<$else$>"<$Model.Urls.Profile$>"<$endif$>><$Model.Text.LinkProfileText$></a>
  </div>
  <$endif$>
  <div class="profileBox changePasswordBox">
    <a href="<$Model.Urls.ChangePassword$>"<$if (Model.IsAdminView)$> target="_blank"<$endif$>><$Model.Text.LinkChangePasswordText$></a>
  </div>
  <div class="profileBox loggedAction">
    <$control.Form(formBegin = "true", action = Model.Urls.SignOut)$>
      <input type="submit" size="20" value="<$Model.Text.LinkSignOutText$>" id="ctl00_LeftMenuArea_Authentication1_loginViewControl_LogoutButton" class="loginBoxLogout">
    <$control.Form(formEnd = "true")$>
  </div>
</div>
<$else$>
<$if (Model.Settings.Layout == "Horizontal")$>
<div class="loginContainerForm orientation<$Model.Settings.Layout$> oAuthIs<$Model.Settings.ShowOpenAuthButtons$>">
  <$if(Model.Settings.ShowOpenAuthButtons)$>
  <$control.OAuthForm(id=Model.Id + "_oAuthForm")$>
  <$endif$>
  <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
    <input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
    <input type="hidden" name="CurrentUrl" id="<$Model.Id$>_currentUrl" value="<$Model.Urls.Current$>">
    <input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
    <$if (Model.StayOnTheSamePage)$>
    <input type="hidden" name="stayOnTheSamePage" value="true">
    <$endif$>
    <div>
      <$UserName()$>
      <$Password()$>	 
      <$if(Model.Captcha.Enabled)$>	  
        <div style="display:inline-block; vertical-align:bottom">
            <$control.GoogleReCaptcha(Model=Model.Captcha)$> 
        </div>
      <$endif$>
	  <$Button()$>
    </div>
    <div>
      <$RememberMe()$>
      <$ForgotPassword()$>
    </div>     
  <$control.Form(formEnd = "true")$>
</div>
<$endif$>
<$if (Model.Settings.Layout == "Vertical")$>
<div class="loginContainerForm orientation<$Model.Settings.Layout$> oAuthIs<$Model.Settings.ShowOpenAuthButtons$>">
  <$if(Model.Settings.ShowOpenAuthButtons)$>
  <$control.OAuthForm(id=Model.Id + "_oAuthForm")$>
  <$endif$>
  <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
    <input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
    <input type="hidden" name="CurrentUrl" id="<$Model.Id$>_currentUrl" value="<$Model.Urls.Current$>">
    <input type="hidden" name="browserData" id="<$Model.Id$>_browserField">
    <$if (Model.StayOnTheSamePage)$>
        <input type="hidden" name="stayOnTheSamePage" value="true">
    <$endif$>
    <$UserName()$>
    <$Password()$>
    <$RememberMe()$>
    <$ForgotPassword()$>	
    <$control.GoogleReCaptcha(Model=Model.Captcha)$> 
    <$Button()$>
  <$control.Form(formEnd = "true")$>
</div>
<$endif$>
<$endif$>
<script>
  jq$().ready(function() {
    var browserField = document.getElementById('<$Model.Id$>' + '_browserField');

    if (browserField) {
      browserField.value = browserInfo.getBrowserCapabilitiesData();
    }

    jq$('#<$Model.Id$>' + '_form').FormValidate();
    jq$('.WaGadgetLoginForm form').attr('data-disableInAdminMode', 'false');
  });
</script>
<$endif$>
<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>