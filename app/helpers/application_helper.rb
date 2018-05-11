module ApplicationHelper
    def format_date(date)
        date.strftime('%d.%m.%Y')
    end

    def bc_link(name, link = nil)
        content_tag :li, itemscope: 'itemscope', itemtype: 'http://data-vocabulary.org/Breadcrumb', class: "breadcrumb-item #{link ? nil : 'active'}" do
            if link
                link_to link, itemprop: 'url' do
                    content_tag :span, itemprop: 'title' do
                        name
                    end
                end
            else
                content_tag :span, itemprop: 'title' do
                    name
                end
            end
        end
    end
end
