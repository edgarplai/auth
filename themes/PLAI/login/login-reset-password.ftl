<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayInfo=true
  displayMessage=!messagesPerField.existsError("username")
  ;
  section
>
  <#if section="header">
    ${msg("emailForgotTitle")}
  <#elseif section="form">
    <form action="${url.loginAction}" class="m-0 space-y-4" method="post">
      <div>
        <@inputPrimary.kw
          autocomplete=realm.loginWithEmailAllowed?string("email", "username")
          autofocus=true
          invalid=["username"]
          name="username"
          type="text"
          placeholder="Usuario o email"
          value=(auth?has_content && auth.showUsername())?then(auth.attemptedUsername, '')
        >
          <@labelUsername.kw />
        </@inputPrimary.kw>
      </div>
      <div>
        <@buttonPrimary.kw type="submit">
          Recuperar contraseña
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="info">
    Ingrese su dirección de correo electrónico y le enviaremos instrucciones sobre cómo crear una nueva contraseña.
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span class="text-sm"><< Regresar</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
