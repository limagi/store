Spree::HomeController.class_eval do
  def index
    @taxonomies = Spree::Taxonomy.includes(root: :children)
    @top_content = Spree::Page.find_by_slug('/main_top_info')
    @bottom_content = Spree::Page.find_by_slug('/main_bottom_info')
    @articles = Article.order(id: :desc).limit(3)
    @promotions = Spree::Promotion.order(id: :desc).limit(3)
  end
end