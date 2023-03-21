#!/usr/bin/env ruby

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'thin', require: false
  gem 'sinatra', require: false
  gem 'rerun', require: false
end

# Fuck you and your american spelling
class String
  alias capitalise capitalize
end

require 'sinatra'

get '/' do
  erb :main, locals: { title: if (title = params[:title]).nil?
                                'New tab'
                              else
                                title.capitalise
                              end }
end

__END__

@@head
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://unpkg.com/@picocss/pico@1.*/css/pico.min.css">
  <title><%= title %></title>
  <style type="text/css" media="screen"></style>
</head>

@@main
<html>
  <%= erb :head, :locals => {title: title} %>
  <body>
    <main class="container">
      <h1><%= title %></h1>
      <form action="" method="get">
        <label for="title">Change tab title</label>
        <input type="text" name="title"/>
      </form>
    </main>
  </body>
</html>
