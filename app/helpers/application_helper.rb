module ApplicationHelper

    def nav_link(text,path)
        if current_page?(path)
            current_tag :li, class: "nav-item" do 
                link_to(text, path, class: "nav-link active", aria: { current: 'page'})
            end
        else
            content_tag :li, class: "nav_items" do
                link_to(text, path, class: 'nav-link')
            end
        end
    end

end
