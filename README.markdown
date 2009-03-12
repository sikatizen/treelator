# Treelator
  
  
## Install

First you need to install compass. 

For this you have to install haml 2.1.0:

git clone git://github.com/nex3/haml.git

cd haml

rake install

The install compass:

sudo gem install chriseppstein-compass -s http://gems.github.com/

Now you're ready to install the app:

clone the repo: git clone git@github.com:sikatizen/treelator.git

configure database.yml

Migrate: rake db:migrate

add the first user: rake treelator:add_admin login=login password=password email=email"

Launch the server: script/server

## Usage

## Contributors

Noé Froidevaux, Jonathan Biolaz
  
## License

Copyright (c) 2008 Sikatizen
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.