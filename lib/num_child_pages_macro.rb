module RedmineWikiMacrosCollection
  Redmine::WikiFormatting::Macros.register do
    desc "Displays the number of child pages " 

    macro :num_child_pages do |obj, args|
        o =  obj.page.descendants.size 
         
    end

  end
end
