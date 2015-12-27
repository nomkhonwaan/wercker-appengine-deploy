# Wercker Steps - AppEngine Deploy

This project is Wercker Steps for deploy your application to Google AppEngine by using refresh token.


## Table of Contents

* [Usage](#usage)
* [Refresh Token](#refresh-token)
* [Author](#author)
* [License](#license)


## Usage

To use this Wercker Steps you need to create wercker.yml and put the line of codes in deploy section like this

```
deploy:
  steps:
    - nomkhonwaan/appengine-deploy:
        token: $APP_ENGINE_TOKEN
```


## Refresh Token

The refresh token is required for using on deploy to Google AppEngine. You can find it inside your home directory at file `.appcfg_oauth2_tokens`. If this file is not exists you will need to authorize your application first.

For authorize your application in local PC you need to download and install AppEngine SDK by your self, authorize by using this command

```
$ appcfg.py update -A project-id /path/to/project
```

when `.appcfg_oauth2_tokens` created you can see your token credentials and other information as a JSON format, find the "refresh_token" and copy your refresh token.

You need to create environment variable at your project setting.

Settings > Targets > Add deploy target > custom deploy

fill your deploy target information and click edit target button and click Add new variable

- Environment variable -> APP_ENGINE_TOKEN
- Text -> paste your refresh token here
- Projected -> checked

then click OK and save your custom deploy target.


## Author

Natcha Luang - Aroonchai

* Email: <me@nomkhonwaan.com>
* Website: <https://www.nomkhonwaan.com>
* Twitter: [@nomkhonwaan](https://twitter.com/nomkhonwaan)


## License

[MIT](https://raw.githubusercontent.com/nomkhonwaan/wercker-appengine-deploy-oauth/master/LICENSE)
