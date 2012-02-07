module ImagesHelper

  def full_url(type, file)
    url_for(:controller => :images, :action => type, :file => file, :only_path => false)
  end

end
