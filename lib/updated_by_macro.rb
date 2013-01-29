module RedmineWikiMacrosCollection 
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to displays the user who updated the page last" 

    macro :page_updated_by do |obj, args|
        if !obj.is_a?(WikiContent) && !obj.is_a?(WikiContent::Version)
            raise 'This macro can be called from wiki pages only.'
        end
        content = obj.is_a?(WikiContent) ? obj : obj.page.content 
        o = '<span class="cmhr_wiki_macros_updated_by">'
        includeAvatar = args.any? && args.first
	if includeAvatar 
		o << "#{avatar(content.author, :size => "14")} "
        end
        o << link_to_user(content.author)
        o << '</span>'
        o.html_safe 
    end

  end
end
