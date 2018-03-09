# basic install creates postgres user who is admin
sudo su -i -u postgres
createdb workdb
create role root with login PASSWORD 'superroot' superuser;
create role workstoreapiuser with login PASSWORD 'workstoreapi';
create role testworkuser with LOGIN PASSWORD 'testwork';

grant all privileges on database workdb to workstoreapiuser;

grant all privileges on database workdb to testworkuser;
