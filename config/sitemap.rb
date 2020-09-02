# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://bakeisyum.herokuapp.com/"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do

  add about_path, changefreq: 'yearly'
  add contact_path
  add privacy_policy_path
  add terms_and_conditions_path


  add recipes_path, changefreq: 'daily'
  count = 0
  recipes_per_page = 6
  Recipe.find_each do |recipe|
    add recipe_path(recipe), changefreq: 'yearly', lastmod: recipe.updated_at
    count += 1
    if count % recipes_per_page == 0
      n = 1 + count/recipes_per_page
      add recipes_path+ "?page=" + n.to_s, changefreq: 'weekly'
    end

  end

end
