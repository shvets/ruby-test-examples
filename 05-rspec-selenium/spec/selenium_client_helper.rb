require "selenium/client"

class Selenium::Client::Driver
  alias original_click click

  def click locator, *params
    original_click locator

    if params.size > 0
      wait_for_condition "selenium.browserbot.getCurrentWindow().jQuery.active == 0" if params[0][:ajax] == true

      wait_for_page_to_load "30000" if params[0][:wait] == true
    end
  end

  alias original_select select

  def select *args
    ajax = false
    if args[args.size-1].class == Hash
      if(args[args.size-1][:ajax] == true)
        args.delete_at(args.size-1)
        ajax = true
      end
    end

    original_select *args
    #wait_for_condition "selenium.browserbot.getCurrentWindow().jQuery.active == 0"
    #wait_for_condition(sleep(2500), 25000)

    sleep 2 if ajax
  end

end

module Selenium::Client::Base
  alias originalInitialize initialize

  def initialize(*args)
    originalInitialize *args

    @highlight_located_element_by_default = true
    #@timeout_in_seconds = 30
  end
end
