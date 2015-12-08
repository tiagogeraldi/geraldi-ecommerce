class Admin::SettingsController < AdminController
  before_filter do
    set_klass(Setting)
    set_search_attrs(['name', 'description'])
  end

  private

  def resource_params
    params.require(:setting).permit(:name, :description)
  end
end
