module RedmineWikiMacrosCollection
  Redmine::WikiFormatting::Macros.register do
    desc "Displays the number of child pages " 

    macro :num_child_pages do |obj, args|
        if !obj.is_a?(WikiContent) && !obj.is_a?(WikiContent::Version)
            raise 'This macro can be called from wiki pages only.'
        end

        #o =  obj.page.descendants.size
        directChildrenOnly = args.any? && args.first 
        if directChildrenOnly 
            o =  obj.page.children.size 
        else
            o =  obj.page.descendants.size 
        end
         
    end

  end
end
