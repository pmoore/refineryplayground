# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed


@usr = Refinery::User.where(:username => 'ww_admin')
if @usr.blank?
  Refinery::User.skip_callback(:save, :before)
  @usr = Refinery::User.create({:username => 'ww_admin', :email => 'pmoore@weddingwire.com', :password => 'password'})
  @usr.add_role :refinery
  @usr.add_role :superuser
  @usr.save
  Refinery::User.set_callback(:save, :before)
end
# Added by Refinery CMS Blog engine
Refinery::Blog::Engine.load_seed
