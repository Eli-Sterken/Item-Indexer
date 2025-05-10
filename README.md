# Welcome To Item Indexer

<img src=".github/images/Logo.png" alt="Repository Logo" width="300" height="300">

# Link Coming Soon

Hello there, and welcome to the official Item Indexer GitHub repository! Item Indexer is an app that allows you to store items with
long codes or descriptions using a numeric code. This can save time typing out/printing long names and descriptions, as well as 
making it easy to set up custom naming conventions for large amounts of items. Item Indexer can be very useful in warehouse-like 
environments, where a quick and easy solution for keeping inventory is required. Click the link above to start using Item Indexer today, 
or read further to see how it works and how to set it up yourself!

## How it Works

Item Indexer is built using the [Nuxt](https://nuxt.com) full-stack framework. Nuxt uses [Vue](https://vuejs.org) as the front-end JavaScript framework,
and [Nitro](https://nitro.build) as the main backend server engine.

## How To Use

If you want to get up and going with Item Indexer right away, just use the link at the top of this file. But if you want to set it up on your 
local machine or contribute to the project, you can follow the directions below. Please make sure you have [Git](https://git-scm.org), [Node.js](https://nodejs.org), 
and [Pnpm](https://pnpm.io) installed before you continue. 

## To Set Up On Local Machine

To set up Item Indexer on your local machine, follow the directions below:

1. Clone Repository

   To get started, clone the Item Indexer GitHub repository onto your local machine using the following command:
   ```zsh
   git clone https://github.com/Eli-Sterken/Item-Indexer
   ```
3. Enter Directory

   Next, enter the directory where the Item Indexer code was cloned using this command:
   ```zsh
   cd Item-Indexer
   ```
5. Install Dependencies

   Install all the required dependencies using this final command:
   ```zsh
   pnpm install
   ```
And that's it, you have Item Indexer all ready to go on your very own machine! You can leave off like this, or learn how to set up a development server or deploy Item Indexer below.

## Run Development Server or Deploy

If you want to run a development server or deploy your own version of Item Indexer, there are a few things you will need to do. I'll walk you through them below.

1. Link Project To NuxtHub

   Before you can do anything, you have to link your project to NuxtHub. To do this, just run
   ```zsh
   pnpm exec nuxthub link
   ```
   You will be required to create a free NuxtHub and Cloudflare account if you don't have them already.
3. Run Development Server

   After you link your project, you can run a development server. To do that, just use this command:
   ```zsh
   pnpm dev
   ```
4. Deploy to the web

   If you want to deploy your own version of Item Indexer to the web, there are two ways to do it. Number one (which I recommend) is to link a GitHub repository. All you have to do is
   publish your code to a GitHub repository, and then you can link it to NuxtHub. Your project will be redeployed on every commit to main. You can learn how to do this in the [NuxtHub docs](https://hub.nuxt.com/docs/getting-started).
   Then there is method 2, doing a one-time deployment. You can do this by running
   ```zsh
   pnpm exec nuxthub deploy
   ```

And there you have it! A fully functioning deployment or dev server. Please note that in production, you must set an environment variable (```NUXT_SESSION_PASSWORD```) to a string with 32+ characters.
This is to encrypt session tokens, and is auto generated in development.

## Social Links

If you like this project and want to connect with me or other programmers, use the social links below!

Reddit - [u/eli_sterken](https://reddit.com/user/eli_sterken)

Discord - [Item Indexer](https://discord.gg/Zr7XXEZCuD)

## Notes

These are general notes or notices about the project.

1. If there is no code or starter code in the main branch, that means I'm still working on the initial release. Check back soon!

# Have Fun!
