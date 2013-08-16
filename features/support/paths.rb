module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)

    case page_name

    when /the home\s?page/
      '/'

    when /absolute path "(.+?)"/
      $1

    when /^the section (.+?) page$/
      section_goods_path(created_model("section #{$1}"))

    when /^the category (.+?) page$/
      category = created_model("category #{$1}")
      category_goods_path(category.section, category)

    when /^the #{capture_model}(?:'s)? page$/
      path_to_pickle $1

    # admin pages
    when /^the admin category page$/
      category = created_model('category')
      admin_section_category_path(category.section, category)

    when /^the admin good page$/
      good = created_model('good')
      admin_section_category_good_path(good.category.section, good.category, good)

    when /^the admin section (.+?) categories page$/
      section = created_model("section #{$1}")
      admin_section_categories_path(section)

    when /^the admin section (.+?) goods page$/
      section = created_model("section #{$1}")
      admin_section_goods_path(section)

    when /^the admin category (.+?) goods page$/
      model = created_model("category #{$1}")
      admin_section_category_goods_path(model.section, model)

    when /^the edit admin category page$/
      category = created_model('category')
      edit_admin_section_category_path(category.section, category)

    when /^the edit admin good page$/
      good = created_model('good')
      edit_admin_section_category_good_path(good.category.section, good.category, good)

    when /^the admin #{capture_model}(?:'s)? page$/
      model = created_model($1) 
      if model
        path_to_pickle $1, :action => 'admin'
      else
        send("admin_#{$1}_path", $1.capitalize.constantize.last)
      end      

    when /^the new admin section (.+?) category page$/
      section = created_model("section #{$1}")
      new_admin_section_category_path(section)

    when /^the new admin category (.+?) good page$/
      category = created_model("category #{$1}")
      new_admin_section_category_good_path(category.section, category)

    when /^the new admin #{capture_model}(?:'s)? page$/
      send("new_admin_#{$1}_path")

    when /^the edit admin #{capture_model}(?:'s)? page$/
      path_to_pickle $1, :action => "edit admin"

    # the following are examples using path_to_pickle    

    when /^#{capture_model}(?:'s)? #{capture_model}(?:'s)? page$/   # eg. the forum's post's page
      path_to_pickle $1, $2

    when /^#{capture_model}(?:'s)? #{capture_model}'s (.+?) page$/  # eg. the forum's post's comments page
      path_to_pickle $1, $2, :extra => $3                           #  or the forum's post's edit page

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        path = path_components.push('path').join('_').to_sym
        self.send(path)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)