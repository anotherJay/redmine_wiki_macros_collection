module RedmineWikiMacrosCollection 
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to display the date the page was last updated " 

    macro :page_updated_date do |obj, args|
        o = '<span class="cmhr_wiki_macros_updated_date">'
        o << l(:label_page_updated_date, time_tag(obj.updated_on))
        o << '</span>'
        o.html_safe 
    end

  end
end
