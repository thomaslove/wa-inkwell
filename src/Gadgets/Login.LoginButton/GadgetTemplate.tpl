<$if(!Model.IsHiddenOnPage)$>
<div class="align<$Model.Settings.Align$>">
  <$if(Model.Security.IsAuthenticated)$>
  <$if(Model.IsLapsedMembership)$>
  <div class="loginBoxLapsedMembership"><$Model.Text.LabelLapsed$></div>
  <$endif$>
  <div class="loginBoxProfileLink">
    <$if (!Model.IsSystemAdminView)$>
    <a href=<$if (Model.IsAdminView)$>"<$Model.Urls.ContactDetails$>" target="_blank"<$else$>"<$Model.Urls.Profile$>"<$endif$>><$Model.UserFullName$></a>
    <$endif$>
  </div>
  <a class="loginBoxChangePassword" href="<$Model.Urls.ChangePassword$>"<$if (Model.IsAdminView)$> target="_blank"<$endif$>><$Model.Text.LinkChangePasswordText$></a>
  <a class="loginBoxLogout" href="<$Model.Urls.SignOut$>"<$if (Model.IsAdminView)$> target="_top"<$endif$>><$Model.Text.LinkSignOutText$></a>
  <$else$>
  <div class="loginBoxLinkContainer">
    <a class="loginBoxLinkButton" href="<$Model.Urls.Authenticate$>"><$Model.Text.LinkSignInText$></a>
  </div>
  <$endif$>
</div>
<$endif$>