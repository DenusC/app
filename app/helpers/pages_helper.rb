module PagesHelper
  def menu(link, title = nil, &blk)
    if block_given?
      content_tag(:li, class: 'ui-border-r' , data:{ href: link }, &blk)
    else
      content_tag(:li,
        content_tag(:a, title, href: link),
        class: 'ui-border-r' , data:{ href: link }
      )
    end
  end
end
