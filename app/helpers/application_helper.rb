module ApplicationHelper
  def plural(class_name)
    class_name.model_name.human(:count => 2)
  end

  def singular(class_name)
    class_name.model_name.human
  end

  def add_item_label(element)
    "#{t('add')} #{element}"
  end

  def site_name
    @site_name ||= Rails.application.secrets.site_name
    @site_name ||= 'My E-commerce'
  end
end
