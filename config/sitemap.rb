# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://bakeisyum.herokuapp.com/"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do

  add about_path, changefreq: 'yearly'
  add contact_path
  add privacy_policy_path
  add terms_and_conditions_path


  add recipes_path, changefreq: 'daily'
  Recipe.find_each do |recipe|
    add recipe_path(recipe), changefreq: 'yearly', lastmod: recipe.updated_at
  end

end
