#!/usr/bin/env ruby

start_time = Time.now
p 'study_web'
`docker build . -t johnsonzhan121/study_web`

p 'study_nginx'
`docker build docker/nginx/. -t johnsonzhan121/study_nginx`

p 'push local docker'

p 'push study_web'
`docker push johnsonzhan121/study_web`
p 'push study_nginx'
`docker push johnsonzhan121/study_nginx`

p 'update docker-compose.yml'
`scp docker-compose.yml root@178.128.214.6:/home/study`

p 'remote docker pull'
`ssh root@178.128.214.6  'docker pull johnsonzhan121/study_web'`
`ssh root@178.128.214.6  'docker pull johnsonzhan121/study_nginx'`

p 'remote docker-compose up'

end_time = Time.now

p "#{end_time - start_time} seconds"
`ssh root@178.128.214.6  'cd /home/study/ && docker-compose up'`


