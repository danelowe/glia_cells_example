require 'cells'
require 'glia'
require 'haml'
require 'lotus/router'
require 'lotus/action'
require 'lotus/controller'
require 'request_store'
require 'json'
require 'pry'

$LOAD_PATH.unshift(File.dirname(__FILE__))

class Application
  class << self
    attr_accessor :root, :router
  end
  self.root = File.expand_path(File.dirname(__FILE__))
end

Lotus::Controller.configure do
  default_format :html
  prepare do
    include Core::Action::Layout
  end
end

Dir[File.expand_path('../lib/**/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../modules/**/*.rb', __FILE__)].each {|f| require f}

Application.router = Lotus::Router.new do
  get '/', to: 'pages#show'
  resources :recipes, only: [:show, :index]
  get '/*', to: 'pages#show'
  get '/:id', to: 'pages#show', as: :page
end

Rack::Server.start app: Application.router, Port: 2300