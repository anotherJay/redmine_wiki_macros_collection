module RedmineWikiMacrosCollection 
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to display a link to the diff of the last wiki revision" 

    macro :latest_diff do |obj, args|
        if !obj.is_a?(WikiContent) && !obj.is_a?(WikiContent::Version)
            raise 'This macro can be called from wiki pages only.'
        end

       	versionTo = obj.is_a?(WikiContent) ? obj.version : obj.page.content.version
        o = ''
        if versionTo > 1    
            o = '<span class="cmhr_wiki_macros_link_to_history">'
            o << link_to(l(:label_latest_diff), url_for( :controller => 'wiki', :action => 'diff', :id => obj.page.title, :version => versionTo)  )
            o << '</span>'
        end
        o.html_safe 
    end

  end
end
