module ApplicationHelper
  def friendly_bed_path(bed)
    "/beds/#{bed.code}"
  end

  def index_edit_link(link)
    link_to link, class: 'btn btn-default btn-xs' do
      fa_icon('edit') + 'Edit'
    end
  end

  def index_show_link(link)
    link_to link, class: 'btn btn-default btn-xs' do
      fa_icon('eye') + 'Show'
    end
  end

  def index_destroy_link(link)
    link_to link, class: 'btn btn-danger btn-xs', method: :delete, data: { confirm: 'Are you sure?' } do
      fa_icon('trash') + 'Delete'
    end
  end

  def human_boolean(boolean)
    content_tag(:span, class: 'human-boolean', style: "color: #{boolean ? 'green' : 'red'}" ) do
      if boolean
        fa_icon('check')
      else
        fa_icon('minus')
      end
    end
  end
end
