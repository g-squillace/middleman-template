require "lib/path_helpers"
require "lib/image_helpers"

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

set :url_root, ENV.fetch('BASE_URL')

ignore '/templates/*'

LOCALES = ENV['LANGS'].split(",").map(&:to_sym)
activate :i18n, langs: LOCALES, mount_at_root: LOCALES[0]

activate :asset_hash
activate :directory_indexes
activate :pagination
activate :inline_svg

activate :dato, token: ENV.fetch('DATO_API_TOKEN'), live_reload: true

webpack_command =
  if build?
    "yarn run build"
  else
    "yarn run dev"
  end

activate :external_pipeline,
  name: :webpack,
  command: webpack_command,
  source: ".tmp/dist",
  latency: 1

configure :build do
  activate :minify_html do |html|
    html.remove_input_attributes = false
  end
  activate :search_engine_sitemap,
    default_priority: 0.5,
    default_change_frequency: 'weekly'
end

configure :development do
  activate :livereload
end

require "lib/menu_helpers"
helpers MenuHelpers

helpers do
  include PathHelpers
  include ImageHelpers

  def active?(url)
    (url === "/#{I18n.locale}/" && current_page.url === "/#{I18n.locale}/") ||
      (url != "/#{I18n.locale}/" && current_page.url[0...-1].eql?(url)) ||
      url == current_page.url
  end

  def active_link_to(name = nil, options = nil, html_options = {}, &block)
    if block_given?
      options[:class] = options.fetch(:class, "") + " is-active" if active?(name)
      link_to capture(&block), name, options
    else
      html_options[:class] = html_options.fetch(:class, "") + " is-active" if active?(options)
      link_to name, options, html_options
    end
  end

  def favicon_json_path(path, escape = '\/')
    image_path(path).gsub(/\//, escape)
  end    

  # def footer_menu
  #   [
  #     dato.page_estate,
  #     dato.terroir,
  #     dato.wine_index,
  #     dato.bio,
  #     dato.experience,
  #     dato.contact
  #   ]
  # end  
    
  # def site_nav_menu
  #   [
  #     MenuHelpers::CustomMenu.new(I18n.t('nav.estate'), "#", esate_child),
  #     dato.terroir,
  #     dato.wine_index,
  #     dato.bio,
  #     MenuHelpers::CustomMenu.new(I18n.t('nav.ospitality'), "#", ospitality_child),
  #     dato.contact
  #   ]
  # end

  # def esate_child
  #   [
  #     MenuHelpers::Children.new("", "", [
  #       dato.page_estate,
  #       dato.project,
  #       dato.cellar,
  #       dato.family,
  #       dato.cline_cellar
  #     ])
  #   ]
  # end

  # def ospitality_child
  #   [
  #     MenuHelpers::Children.new("", "", [
  #       dato.experience,
  #       dato.wedding,
  #       dato.meeting
  #     ])
  #   ]
  # end  

end

dato.tap do |dato|

  LOCALES.each do |locale|
    I18n.with_locale(locale) do
      prefix = locale == LOCALES[0] ? "" : "/#{locale}"

      proxy "#{prefix}/index.html",
        "/templates/homepage.html",
        locals: { page: dato.homepage },
        locale: locale
        
      # dato.news_pages.each do |news|
      #   proxy "#{prefix}/#{news.category.slug}/#{news.slug}/index.html",
      #     "/templates/news_page.html",
      #     locals: { page: news },
      #     locale: locale
      # end  

      # proxy "#{prefix}/#{dato.contact_page.slug}/index.html",
      #   "templates/contact_page.html",
      #   locals: { page: dato.contact_page },
      #   locale: locale        
    
    end
  end

end

proxy "site.webmanifest",
  "templates/site.webmanifest",
  :layout => false

proxy "browserconfig.xml",
  "templates/browserconfig.xml",
  :layout => false

proxy "/_redirects",
  "/templates/redirects.txt",
  :layout => false
