require 'action_view'
require 'cells'
require 'cell/haml'
require 'glia'
require 'haml'
require 'lotus/router'
require 'lotus/action'
require 'lotus/controller'
require 'request_store'
require 'json'

$LOAD_PATH.unshift(File.dirname(__FILE__))

class Application
  class << self
    attr_accessor :root
  end
  self.root = File.expand_path(File.dirname(__FILE__))
end

Lotus::Controller.configure do
  default_format :html
  prepare do
    include Core::Action::Layout
  end
end

Dir[File.expand_path('../modules/**/*.rb', __FILE__)].each {|f| require f}


app = Lotus::Router.new do
  get '/', to: 'pages#show'
  resource :cocktails, only: [:show, :index]
end

Rack::Server.start app: app, Port: 2300