module HtmlSelectorsHelper
  def selector_for(scope)
    case scope
      when /the body/
        "html > body"
      when /the (notice|error|info) flash/
        ".flash.#{$1}"
    else
      begin
        scope =~ /the (.*)/
        components = $1.split(/\s+/)
        selector = "//*[@id='#{components.join('_')}']"
        page.find(:xpath, selector)
        selector
      rescue Object => e
        raise "Can't find mapping from \"#{scope}\" to a selector.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(HtmlSelectorsHelper)