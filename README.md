<div align="center" style="object-fit: contain">
    <img src="./app/assets/images/opengraph/image.png"/>
</div>

# ⚠️ Help Wanted
Website: [Pandemic Volunteers](https://pandemicvolunteers.org)

Knowledge base: [https://www.notion.so/Pandemic-Volunteers](https://www.notion.so/Pandemic-Volunteers-cf5a155708614c3fa77f00d93bdd02a1)

We need help in HR, PR, PM, design and development. Please get in touch through: https://helpwithcovid.com/projects/441-pandemic-volunteers or `contact@pandemicvolunteers.org`

# ⭐ Give Us a Star!
It helps us by getting exposed to your followers. We need more hands.

# 🕵️ Looking for Feedback

Please have a look at https://PandemicVolunteers.org

Feedback from doctors, medical workers and more would be really appreciated.

Get in touch via email: `contact@pandemicvolunteers.org`

# 👩‍💻 Development

Instructions below are for macOS.

## Prerequisites

* [Homebrew](https://brew.sh/):

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

* [rvm](https://rvm.io/rvm/install):

```sh
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

## Setup

### Fork this project

Fork your own copy of hantuzun/pandemic-volunteers to your account.
Run the command below in your repository.

```sh
$ git clone https://github.com/your-account/pandemic-volunteers

$ cd pandemic-volunteers
```

### Install Ruby 2.7.1

```sh
$ rvm install 2.7.1

$ rvm use --default 2.7.1

$ ruby --version
```

Your ruby version output should begin with `ruby 2.7.1`.


### Install required dependencies

```sh
$ brew install yarn

$ brew install postgresql

$ gem install bundler:2.1.4
```

### Install 

```sh

$ bundle install
...
```

## Run

Run PostgreSQL. It is required for you to develop the application on your local machine.

```sh
$ brew services start postgresql
```

Run the project:

```sh
$ rails server
```

On your first time running the project, and whenever the DB schema is updated, you need to update your local DB with the following command:

```sh
$ rails db:migrate
```

Visit http://localhost:3000


## Deployment

### Environment Variables

 * `DOMAIN`: `pandemicvolunteers.org` Required for Open Graph Images paths and emails.
 * `SENDGRID_API_KEY`: Required for sending emails.
