# Challenge #10 – How Low Can You Limbo

![Limbo](https://cms.craftcodingchallenge.com/assets/images/limbo.jpg)

View the challenge description at:   
https://www.craftcodingchallenge.com/challenge-10-how-low-can-you-limbo

This repo extends the stellar [Spin Up Craft](https://github.com/nystudio107/spin-up-craft) template repo by @nystudio107.

## Work on the challenge in a browser via GitHub Codespaces

1. Click this button:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=614126211)

2. In the resulting Terminal window, type `make dev` to start the project up
3. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
php_1    | ### Your Craft site is ready!
php_1    | Frontend URL: https://laughing-space-zebra-xg9qxvqjpqhp5qx-8050.preview.app.github.dev/
php_1    | CP URL: https://laughing-space-zebra-xg9qxvqjpqhp5qx-8050.preview.app.github.dev/admin
php_1    | CP User: admin
php_1    | CP Password: project
```

This lets anyone use the project without having to do _any_ local setup.

You can use the Codespaces editor to edit Twig files, load the site frontend, or log into the Craft CP, all from within a browser!

The first time you start up your project in Codespaces, it'll take some time to set everything up. However, subsequent startups will be very quick.

You can access your existing Codespaces here:

https://github.com/codespaces

Click on one to resume it. If you don't see a Terminal window, go to the hamburger  menu in the top-left, and click on **Terminal > New Terminal**

You are limited to 15 active Codespaces on the free plan, but you can go in and delete any older Codespaces you're not using at any time.

## Work on the challenge in local dev

1. Have [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed
2. Clone this repository down with `git clone https://github.com/putyourlightson/craft-coding-challenge-10.git`
3. `cd` to your repo in your terminal
4. Get the project up and running with `make dev`
5. Wait until you see output like this, and then access the site via the credentials that are output on the console:

```
craft-coding-challenge-10-php-1    | ### Your Craft site is ready!
craft-coding-challenge-10-php-1    | Frontend URL: http://localhost:8050/
craft-coding-challenge-10-php-1    | CP URL: http://localhost:8050/admin
craft-coding-challenge-10-php-1    | CP User: admin
craft-coding-challenge-10-php-1    | CP Password: project
```

Hit `Control-C` to terminate the project and spin down the containers

The first time you start up your project, it'll take some time to set everything up. However, subsequent startups will be very quick.
