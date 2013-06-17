require 'sinatra'
require 'erb'

module Webdiag
  class Server < Sinatra::Base

    set :root, "#{File.dirname(__FILE__)}/../../"

    configure do
      Webdiag.tempdir = Dir.mktmpdir
      Webdiag.public = "#{settings.root}/public"
    end

    get '/' do
      erb :index
    end

    post '/create' do
      @diag = params[:diag]
      @diagram = Diagram.create(@diag)
      erb :index
    end

  end
end
