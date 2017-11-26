To install:
 
Download the repo
```
git clone https://github.com/cam-ila/dssd
cd dssd
```

Install bundler and gems
```
gem install bundler
bundle install
```

Edit the *config/database.yml* file to configure your mysql username and password

Then:
```
rake db:setup
rake db:migrate
```

Start sever:

```
rails s -p 3000
```
