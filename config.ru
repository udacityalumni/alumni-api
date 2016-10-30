# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# add Gollum rack
require 'rubygems'
require 'gollum/app'

# gollum_path = File.expand_path(File.dirname(__FILE__)) # CHANGE THIS TO POINT TO YOUR OWN WIKI REPO
gollum_path = Rails.root.join('wiki').to_s
wiki_options = {:universal_toc => false}
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:default_markup, :markdown) # set your favorite markup language
Precious::App.set(:wiki_options, wiki_options)
run Precious::App


run Rails.application
