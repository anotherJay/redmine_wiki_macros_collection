module RedmineWikiMacrosCollection
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to displays the user who created the page" 

    macro :page_created_by do |obj, args|
	if !obj.is_a?(WikiContent) && !obj.is_a?(WikiContent::Version) 
            raise 'This macro can be called from wiki pages only.'
        end

        first = obj.is_a?(WikiContent) ? obj.versions.find_by_version(1) : obj.page.content.versions.find_by_version(1)
        o = '<span class="cmhr_wiki_macros_created_by">'
        includeAvatar = args.any? && args.first
        if includeAvatar 
            o << "#{avatar(first.author, :size => "14")} "
        end
        o << link_to_user(first.author)
        o << '</span>'
        o.html_safe 
    end

  end
end
