<template>
    <div id="body"></div>
    <h1 class="rel-position main-element header">Welcome To Item Indexer!</h1>
    <h2 class="rel-position main-element header">To start using Item Indexer, add an item with a code and description
        below. Then search by code, and you will see the description</h2>
    <div class="rel-position" id="boxesContaner">
        <Search :items="items"></Search>
        <Add :items="items" :modal="modalAssign"></Add>
        <Items :items="items" :modal="modalAssign"></Items>
        <Modal v-if="modal.open" :title="modal.title" :submit-title="modal.submitTitle" :close-title="modal.closeTitle"
            :input="modal.input" @submit="OnModalSubmit"></Modal>
        <Footer :src="src" :-set-mode="SetMode" :mode="mode"></Footer>   
    </div>

</template>

<script setup lang="ts">
import { ref } from 'vue';
import type {ModalAssign, ModalOptions, ModalVal } from './types';

const jt84tyuhg945gy595ygrhg9r = 'MTM0MTE1NjQxMTc4MjA3MDM4Mg';
const jfur9u4jritjoitjrioutotu984tu95uir = 'ZzJhbGNCaURwX1YxbExZY21USkNKeHF1cF9ZNUZEeklleFlnaUgtcW40dXBPMW85Rkd3RXVfTHB1MDY4dl8wVFNldmM';
const accent = ref('rgb(75, 75, 75)');
const bodyColor = ref('rgb(35, 35, 35)');
const items = ref({});
const src = ref('/images/light.png');
let mode = ref<number>(1);
const modal = ref<ModalVal>({
    open: false
});
const keydown = (event:KeyboardEvent) => {
    if (event.ctrlKey === true && event.altKey === true) {
        const key = event.key.toLowerCase();

        if (key === 'l') {
            SetMode(0);
        } else if (key === 'd') {
            SetMode(1);
        } else if (key === 'f') {
            if (document.fullscreenElement) {
                document.exitFullscreen();
            } else {
                document.documentElement.requestFullscreen();
            }
        };
    };
};

onMounted(async () => {
    const localMode = localStorage.getItem('mode');

    if (localStorage.getItem('items')) { // Load saved items, if possible
        try {
            items.value = JSON.parse(localStorage.getItem('items') as string);
        } catch {
            // ADD POPUP HERE
            localStorage.setItem('items', JSON.stringify({}));
        };
    } else {
        localStorage.setItem('items', JSON.stringify({}));
    };

    window.addEventListener('keydown', keydown);

    if (localMode) { // Load saved mode if possible
        const numLocalMode = Number(localMode);
        SetMode(numLocalMode);
        mode.value = numLocalMode;
    } else {
        localStorage.setItem('mode', '1');
        mode.value = 1;
    };

    if(localStorage.getItem('alert') === null) {
        modalAssign({
            title: 'Welcome to Item Indexer! Please note that all items are saved in your browser, so they will be cleared when you clear your browsers cookies.',
            submitTitle: 'Got It!',
            action: (type) => {
                localStorage.setItem('alert', 'true');
            }
        });
    };

    // Discord webhook stuff
    await $fetch(`https://discordapp.com/api/webhooks/${atob(jt84tyuhg945gy595ygrhg9r)}/${atob(jfur9u4jritjoitjrioutotu984tu95uir)}`, {
        method: 'POST',
        headers: {'content-type':'application/json'},
        body: JSON.stringify({
            "content": null,
            "embeds": [
                {
                    "title": "New Visit To Item Indexer",
                    "description": `A new visit to [Item Indexer](https://item-indexer.pages.dev) has been logged with path ${window.location.pathname}`,
                    "color": 65280,
                    "author": {
                        "name": "New Visit",
                        "icon_url": "https://avatars.githubusercontent.com/u/173750068?v=4"
                    }         
                }
            ],
            "attachments": []
        })
    });
});

onBeforeUnmount(() => {
    window.removeEventListener('keydown', keydown);
});

const modalAssign:ModalAssign = (options:ModalOptions) => {
    modal.value = {
        open: true,
        ...options,
    };
};

function ChangeMode() {
    console.log(mode);
    if(mode.value === 0) {
        SetMode(1);
    } else {
        SetMode(0);
    };
};

function SetMode(functionMode: number): void { // Function to set mode
    if (functionMode != 1) {
        bodyColor.value = 'white';
        accent.value = 'rgb(200, 200, 200)';
        localStorage.setItem('mode', '0');
        mode.value = 0;
        src.value = '/images/dark.png';
    } else {
        bodyColor.value = 'rgb(35, 35, 35)';
        accent.value = 'rgb(75, 75, 75)';
        localStorage.setItem('mode', '1');
        mode.value = 1;
        src.value = '/images/light.png';
    };
};

function OnModalSubmit(type: 'submit' | 'close', value: string) {
    if (modal.value.open) {
        modal.value.action(type, value);
        modal.value = {
            open: false,
        };
    };
};

useSeoMeta({ // Set SEO information
    title: 'Item Indexer',
    ogTitle: 'Item Indexer',
    description: 'A funny app to index items by code',
    ogDescription: 'A funny app to index items by code',
    ogImage: 'https://raw.githubusercontent.com/Eli-Sterken/Item-Indexer/refs/heads/main/Logo.png',
    twitterCard: 'summary_large_image'
});
</script>

<style>
    #body {
        position: fixed;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: v-bind(bodyColor);
    }

    .rel-position {
        position: relative;
    }

    .full {
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
    }

    .main-element {
        background-color: #0073cf;
        color: black;
        text-align: center;
        align-content: center;
        border-radius: 7px;
    }

    .clickible {
        border: none;
        text-decoration: none;
    }

    .clickible:hover {
        cursor: pointer;
        opacity: 0.8;
    }

    .n-font {
        font: bold;
        font-size: large;
    }

    .accent {
        background-color: v-bind(accent);
    }

    .header {
        width: 100%;
        height: fit-content;
    }

    .box {
        width: 80%;
        height: fit-content;
        border-radius: 10px;
        margin-bottom: 5%;
    }

    .inputContaner {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .input {
        width: 35%;
        height: 10%;
        margin-bottom: 2%;
    }

    .firstInput {
        margin-top: 3%;
    }

    #boxesContaner {
        display: flex;
        align-items: center;
        flex-direction: column;
        width: 100%;
        height: fit-content;
    }
</style>
