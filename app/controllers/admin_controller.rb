# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  before_filter :authenticate_user!
  after_filter :expire_cache, :only => [:create, :update, :destroy]

  def index
    collection

    if params[:filter] && params[:filter][:term].present?
      @term = params[:filter][:term]

      @resources = @resources.where(like_search_attrs)
    end
  end

  def new
    @resource = @klass.new
  end

  def edit
    @resource = @klass.find(params[:id])
  end

  def create
    @resource = @klass.new(resource_params)
    if @resource.save
      flash[:notice] = t('saved_successfully')
      if params[:commit].in?(['Salvar', 'Save'])
        redirect_to send("edit_admin_#{@klass.to_s.downcase}_path", @resource)
      elsif params[:commit] == 'Pré-visualizar'
        redirect_to @resource
      else
        redirect_to send("admin_#{@klass.to_s.downcase.pluralize}_path")
      end
    else
      flash[:error] = @resource.errors.full_messages.join('. ')
      render :action => 'new'
    end
  end

  def update
    @resource = @klass.find(params[:id])
    if @resource.update_attributes(resource_params)
      flash[:notice] = t('saved_successfully')
      if params[:commit].in?(['Salvar', 'Save'])
        redirect_to send("edit_admin_#{@klass.to_s.downcase}_path", @resource)
      elsif params[:commit] == 'Pré-visualizar'
        redirect_to @resource
      else
        redirect_to send("admin_#{@klass.to_s.downcase.pluralize}_path")
      end
    else
      flash[:error] = @resource.errors.full_messages.join('<br/>')
      render :action => 'edit'
    end
  end

  def destroy
    @resource = @klass.find(params[:id])
    @resource.destroy
    redirect_to send("admin_#{@klass.to_s.downcase.pluralize}_path")
  end

  protected

  def set_klass(klass)
    @klass = klass
  end

  def set_search_attrs(attrs)
    @search_attrs = attrs
  end

  def readonly
    @readonly = true
  end

  private

  def expire_cache
    if Rails.env.production?
      Rails.cache.clear
    end
  end

  def like_search_attrs
    @search_attrs.map do |s|
      "lower(#{s}) like '%#{@term.downcase}%'"
    end.join(' or ')
  end

  def clean_password_fields(model)
    if params[model] && params[model][:password].blank?
      params[model].delete(:password)
      params[model].delete(:password_confirmation)
    end
  end

  def collection
    @resources ||= @klass.paginate(page: params[:page], per_page: 30).order('created_at desc')
  end
end
