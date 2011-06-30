module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
when /the sign up page/
  new_user_registration_path
when /the sign in page/
  new_user_session_path
when /the sign out page/
  #should be destory_user_session_path
  '/users/sign_out'
when /the forgot password page/
  '/users/password/new'
when /the forgot password submitted page/
  '/users/password'
when /the users page/
  users_path
when /the other user's edit page/
  edit_user_path(User.last)
when /that role's view page/
  role_path(Role.last)
when /that user's view page/
  user_path(User.last)


    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
