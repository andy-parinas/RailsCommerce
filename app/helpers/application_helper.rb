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

        nav_links = ""
        nav_items.each do |item|
            nav_links << "<#{tag_type} class='#{tag_type_style}'><a href='#{item[:url]}' class='#{link_style} #{active? params[:controller], item[:controller] }'><i class='zicon fa fa-#{item[:icon]}'></i><span>#{item[:title]}<span></a></#{tag_type}>"
        end

        nav_links.html_safe

    end



    def th_helper name, icon, is_active

        sort_icon = ""

        if icon == "DESC"
            sort_icon = "sort-down"
        elsif icon == "ASC"
            sort_icon = "sort-up"
        end

        if is_active
             header = "<div class='d-flex flex-row'><div class='mr-2'>#{name}</div><div class='ml-2'> <i class='zicon fa fa-#{sort_icon}'></i></div></div>"
        else
             header = "<div class='d-flex flex-row'><div class='mr-2'>#{name}</div><div class='ml-2'> <i class='zicon fa fa-sort'></i></div></div>"
        end
        header.html_safe
    end

    def current_page_params param
        # Modify this list to whitelist url params for linking to the current page
        request.params.slice(param)
      end
end
