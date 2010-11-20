# Themes

Plugin to provide theme support for Rails applications.

## Usage

It expects the following folder structure.

    app_root/
      public/
        themes/
          [theme_name]/
            templates/
            images/
            javascripts/
            stylesheets/

You specify which theme to use in your controller by using 
the declarative `theme` syntax.

    class ApplicationController < ActionController::Base
      theme "theme_name"
    end

You can also defer the theme lookup to a controller method:

    class ApplicationController < ActionController::Base

      theme :set_theme

      def set_theme
        request.domain
      end

    end

Copyright © 2010 Francesc Esplugas, released under the MIT license
