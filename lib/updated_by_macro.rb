module RedmineWikiMacrosCollection 
  Redmine::WikiFormatting::Macros.register do
    desc "Macro to displays the user who updated the page last" 

    macro :page_updated_by do |obj, args|
        o = '<span class="cmhr_wiki_macros_updated_by">'
        includeAvatar = args.any? && args.first
	if includeAvatar 
		o << "#{avatar(obj.author, :size => "14")} "
        end
        o << link_to_user(obj.author)
        o << '</span>'
        o.html_safe 
    end

  end
end
