module Backend
  module MenuHelper
    def menu(title, path)
      klass = 'active' if current_page? path
      content_tag(:li, link_to(title, path), class: klass)
    end
  end
end
