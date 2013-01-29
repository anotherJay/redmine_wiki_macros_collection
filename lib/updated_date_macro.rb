module RedmineWikiMacrosCollection 
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to display the date the page was last updated " 

    macro :page_updated_date do |obj, args|
        if !obj.is_a?(WikiContent) && !obj.is_a?(WikiContent::Version)
            raise 'This macro can be called from wiki pages only.'
        end
 
        content = obj.is_a?(WikiContent) ? obj : obj.page.content
        o = '<span class="cmhr_wiki_macros_updated_date">'
        o << l(:label_page_updated_date, time_tag(content.updated_on))
        o << '</span>'
        o.html_safe 
    end

  end
end
