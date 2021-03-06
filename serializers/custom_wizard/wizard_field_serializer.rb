# frozen_string_literal: true

class CustomWizardFieldSerializer < ::WizardFieldSerializer
  
  attributes :dropdown_none,
             :image,
             :file_types,
             :limit,
             :property
             
  has_many :choices, serializer: WizardFieldChoiceSerializer, embed: :objects
  
  def label
    return object.label if object.label.present?
    I18n.t("#{object.key || i18n_key}.label", default: '')
  end

  def description
    return object.description if object.description.present?
    I18n.t("#{object.key || i18n_key}.description", default: '', base_url: Discourse.base_url)
  end

  def image
    object.image
  end

  def include_image?
    object.image.present?
  end

  def placeholder
    I18n.t("#{object.key || i18n_key}.placeholder", default: '')
  end

  def dropdown_none
    object.dropdown_none
  end

  def file_types
    object.file_types
  end
  
  def limit
    object.limit
  end
  
  def property
    object.property
  end
end