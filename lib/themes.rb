ActionController::Base.class_eval do

  attr_accessor :current_theme

  ##
  # Use it like the Rails <tt>layout</tt> macro.
  #
  # Example:
  #
  #     theme "theme"
  #
  # -or-
  #
  #     theme :set_theme
  #
  #     def set_theme
  #       request.domain
  #     end
  #
  def self.theme(site_theme)
    write_inheritable_attribute "theme", site_theme
    before_filter :add_theme_path
  end

  protected

  def add_theme_path
    current_theme
    new_path = "#{Rails.public_path}/themes/#{@active_theme}/templates"
    self.prepend_view_path(new_path)
    return true
  end

  def current_theme
    theme = self.class.read_inheritable_attribute("theme")

    @active_theme = case theme
                    when Proc   then theme.call(self)
                    when String then theme
                    when Symbol then send(theme)
                    end
  end

end
