# README

Docker構築前の暫定手順

# How to build this app
1. Rails => rails6 (non docker!)
2. `bundle install`
3. Add Bootstrap, jQuery => `yarn add jquery bootstrap popper.js`
4. Add React `rails webpacker:install:react` => look https://www.petitmonte.com/ruby/rails-react-project.html
5. Add react-router-dom `yarn add react-router-dom`