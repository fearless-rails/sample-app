set :stage, :chefbox

server 'sample-app.com', user: 'deploy', roles: %w{web app db}

set :deploy_to, '/home/deploy/sample-app/'