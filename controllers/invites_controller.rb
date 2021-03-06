module InvitesControllerCustomWizard
  def path(url)
    if Wizard.user_requires_completion?(@user)
      wizard_id = @user.custom_fields['custom_wizard_redirect']

      if wizard_id && url != '/'
        CustomWizard::Wizard.set_submission_redirect(@user, wizard_id, url)
        url = "/w/#{wizard_id.dasherize}"
      end
    end
    super(url)
  end

  private def post_process_invite(user)
    super(user)
    @user = user
  end
end

class InvitesController
  prepend InvitesControllerCustomWizard if SiteSetting.custom_wizard_enabled
end