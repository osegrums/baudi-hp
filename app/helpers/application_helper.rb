module ApplicationHelper
  def friendly_bed_path(bed)
    "/beds/#{bed.code}"
  end

  def friendly_linen_path(linen)
    "/linens/#{linen.code}"
  end

  def friendly_itemable_path(itemable)
    if itemable.is_a?(Bed)
      friendly_bed_path(itemable)
    else
      friendly_linen_path(itemable)
    end
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

  def rich_text(text)
    sanitize text,
      tags: %w(p div b i strong table tbody thead th tr td br a img span),
      attributes: %w(id class style colspan cellspan href src width height border cellpadding cellspacing)
  end

  def lf(object, field)
    object.send(located_field_name(field)) if object
  end

  def located_field_name(field)
    "#{field}_#{I18n.locale}".to_sym
  end

  def main_nav_link(name, path)
    content_tag('li', class: "#{"here" if name.to_s == @active_nav_tab.to_s}") do
      link_to t(".#{name}"), path
    end
  end
end
