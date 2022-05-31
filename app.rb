require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @procjets = Project.all
  erb(:project)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/projects/new') do
  erb(:new_projects)
end

get('/volunteers/new') do
  erb(:new_volunteers)
end

get('/projects/:id/edit') do 
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

get('/projects/:id') do
  @procjets = Project.find(params[:id].to_i())
  erb(:project)
end


post('/projects') do
  title = params[:project_title]
  procjet = Project.new({:title => title, :id => nil})
  procjet.save
  @projects = Project.all
  erb(:projects)
end

patch('/project/:id') do
  @procjet = Project.find(params[:id].to_i())
  @procjet.update(params[:title])
  @procjet = Project.all
  erb(:procjets)
end

delete('/projects/:id') do
  @procjet = Project.find(params[:id].to_i())
  @procjet.delete()
  @procjet = Project.all
  erb(:procjets)
end


get('/projects/:id/volunteers') do 
  @volunteer = Volunteer.find(params[:id].to_i())
  erb(:volunteer)
end

post('/projects/:id/volunteers') do
  name = params[:volunteer_name]
  volunteer = Volunteer.new({:name => name, :id => nil})
  volunteer.save
  @volunteers = Volunteer.all
  erb(:volunteers)
end

patch('/projects/:id/volunteers/volunteer_id') do
  @project = Project.find(params[:id].to_i())
  volunteer = Volunteer.find(params[:volunteer_id].to_i())
  volunteer.update(params[:volunteer_name], @procjet.id)
  erb(:procjet)
end

delete('/projects/:id/volunteers/volunteer_id') do
  @volunteer = Volunteer.find(params[:volunteer_id].to_i())
  @volunteer.delete()
  @procjet = Project.find(params[:id].to_i())
  erb(:procjets)
end