module ApplicationHelper


    def nav_items
        [
            {url: root_path, title: "Shop Dashboard", icon: "home", controller: 'shops'},
            {url: orders_path, title: "Orders", icon: "file", controller: 'orders'},
            {url: products_path, title: "Products", icon: "shopping-cart", controller: 'products'},
            {url: customers_path, title: "Customers", icon: "user", controller: 'customers'},
            {url: reports_path, title: "Reports", icon: "bar-chart", controller: 'reports'},
            
        ]
    end

    def active? current_controller, item_controller
        "active" if current_controller == item_controller
    end



    def nav_helper_with_icon tag_type, tag_type_style, link_style

        puts params[:controller]
        puts params[:action]
        
        nav_links = ""

        nav_items.each do |item|
            puts params[:controller] == item[:controllers]
            nav_links << "<#{tag_type} class='#{tag_type_style}'><a href='#{item[:url]}' class='#{link_style} #{active? params[:controller], item[:controller] }'><i class='zicon fa fa-#{item[:icon]}'></i><span>#{item[:title]}<span></a></#{tag_type}>"
        end

        nav_links.html_safe

    end



end
