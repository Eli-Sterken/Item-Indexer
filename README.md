# Welcome to Item Indexer!

<img src="/Logo.png" alt="Item Indexer Logo" width="300" height="200">

Welcome to the offical Item Indexer GitHub repository! Item Indexer is a funny web app
I made that can index items by code. You can add an item with a code and description, and then
search for the code to get the description. You can also edit and delete items in the All items section.

## How It Works

Item Indexer is built mostly using [Vue](https://vuejs.org) and [Vite](https://vite.dev). I also use Typescript for a better
development experince. Sass is also brought in to help with styling.

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
    - The main file the mounts the app
  - types.ts
    - A file contaning types, mostly for the modal dialog.
  - components
    - A folder with all the app components
    - Search.vue
      - The search component
    - Add.vue
      - The add items component
    - Items.vue
      - The all items component
  - public
    - The folder for all static assets
    - favicon.ico
      - The page icon
    - noscript.css
      - The styling for the <noscript> element

# Notes

1 - I will add things a footer soon, just not in the inital release.
2 - Please note that your items are only saved to local storage, so they will be cleared 
when you delete your browsers cookies and data.

# Have Fun!
