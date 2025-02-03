# Welcome to Item Indexer!

<img src="/Logo.png" alt="Item Indexer Logo" width="300" height="200">

[item-indexer.pages.dev](https://item-indexer.pages.dev)

Welcome to the offical Item Indexer GitHub repository! Item Indexer is a funny web app
I made that can index items by code. You can add an item with a code and description, and then
search for the code to get the description. You can also edit and delete items in the All items section.

## How It Works

Item Indexer is built mostly using [Vue](https://vuejs.org) and [Vite](https://vite.dev). I also use Typescript for a better
development experience. Sass is also brought in to help with styling.

## How To Use
To use Item Indexer, you can go to [item-indexer.pages.dev](https://item-indexer.pages.dev) or build it
on your own system. To do this, open a command line to the repo directory and run the following command:

```
npm install
```
To start a local development server, run
```
npm run dev
```
Or to build for production, run
```
npx nuxt generate
```
this will output to the dist and .output folders.

## File Structure

Item Indexer uses the basic file structure for Vue + Vite apps, but here are
a few main files:

- index.html
  - The main file where the app gets mounted.
- src
  - The main source code folder.
  - App.vue
    - The main app file.
  - main.ts
    - The main file that mounts the app
  - types.ts
    - A file containing types, mostly for the modal dialog.
  - components
    - A folder with all the app components
    - Search.vue
      - The search component
    - Add.vue
      - The add items component
    - Items.vue
      - The all item's component
  - public
    - The folder for all static assets
    - favicon.ico
      - The page icon
    - noscript.css
      - The styling for the <noscript> element

# Notes

1 - I will add a help box soon. (I'm mostly working on other things right now.)
2 - Please note that your items are only saved to local storage, so they will be cleared 
when you delete your browser's cookies and data.

# Have Fun!
