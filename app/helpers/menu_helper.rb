module MenuHelper
  def artbase_link(html_options = {})
    link_to "Arthbase Sync", artbase_index_path
  end

  def collections_link(html_options = {})

    link_to "Collections", collections_path
  end

  def merchandise_link(html_options = {})
    link_to "Merchandise", merchandise_index_path
  end

  def media_link(html_options = {})
    link_to "Media", media_index_path
  end

  def statistics_link(html_options = {})
    link_to "Statistics",  statistics_index_path
  end

  private

  def default_navigation_options(html_options)
  end
end
