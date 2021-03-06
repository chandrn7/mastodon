# frozen_string_literal: true

module InstanceHelper
  def site_title
    Setting.site_title
  end

  def site_hostname
    @site_hostname ||= Addressable::URI.parse("//#{Rails.configuration.x.local_domain}").display_uri.host
  end

  def description_for_sign_up
    prefix = begin
      if @invite.present?
        I18n.t('auth.description.prefix_invited_by_user', name: @invite.user.account.username, instance: site_hostname)
      else
        I18n.t('auth.description.prefix_sign_up', title: site_title)
      end
    end

    safe_join([prefix, I18n.t('auth.description.suffix')], ' ')
  end
end
