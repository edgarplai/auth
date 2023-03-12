<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayMessage=!messagesPerField.existsError("firstName", "lastName", "email", "username", "password", "password-confirm")
  ;
  section
>
  <#if section="header">
    ${msg("registerTitle")}
  <#elseif section="form">
    <form action="${url.registrationAction}" class="m-0 space-y-4" method="post">
      <div>
        <@inputPrimary.kw
          autocomplete="given-name"
          autofocus=true
          invalid=["firstName"]
          name="firstName"
          type="text"
          placeholder="Nombre"
          value=(register.formData.firstName)!''
        >
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="family-name"
          invalid=["lastName"]
          name="lastName"
          type="text"
          placeholder="Apellido"
          value=(register.formData.lastName)!''
        >
        </@inputPrimary.kw>
      </div>
      <div>
        <@inputPrimary.kw
          autocomplete="email"
          invalid=["email"]
          name="email"
          type="email"
          placeholder="Correo"
          value=(register.formData.email)!''
        >
        </@inputPrimary.kw>
      </div>
      <#if !realm.registrationEmailAsUsername>
        <div>
          <@inputPrimary.kw
            autocomplete="username"
            invalid=["username"]
            name="username"
            type="text"
            placeholder="Usuario"
            value=(register.formData.username)!''
          >
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if passwordRequired??>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password", "password-confirm"]
            message=false
            name="password"
            type="password"
            placeholder="Contraseña"
          >
          </@inputPrimary.kw>
        </div>
        <div>
          <@inputPrimary.kw
            autocomplete="new-password"
            invalid=["password-confirm"]
            name="password-confirm"
            type="password"
            placeholder="Confirma contraseña"
          >
          </@inputPrimary.kw>
        </div>
      </#if>
      <#if recaptchaRequired??>
        <div>
          <div class="g-recaptcha" data-sitekey="${recaptchaSiteKey}" data-size="compact"></div>
        </div>
      </#if>
      <div>
        <@buttonPrimary.kw type="submit">
          Registrar
        </@buttonPrimary.kw>
      </div>
    </form>
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span class="text-sm"><< Regresar</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>
