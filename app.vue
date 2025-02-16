<template>
    <div id="body-color">
        <Modal v-if="modal.open" :title="modal.title" :submit-title="modal.submitTitle" :close-title="modal.closeTitle" :input="modal.input" @submit="OnModalSubmit"></Modal>
        <h1 class="main-element rel-position normal-element">Welcome To Item Indexer!</h1>
        <h2 class="main-element rel-position normal-element">Hi there, and welcome to Item Indexer! To get stated, add an item below using the code and description, and then search for it in the search box by typing in the code.<br>You can see all your items in the all items section at the bottom of the page.</h2>
        <div class="rel-position" id="boxes-contaner">
            <div class="main-element rel-position accent box">
                <Search :items="items"></Search>
            </div>
            <div class="main-element rel-position accent box">
                <Add :items="items" :modal="modalAssign"></Add>
            </div>
            <div class="main-element rel-position accent box">
                <Items :items="items" :modal="modalAssign"></Items>
            </div>
        </div>  
        <Footer :set-mode="SetMode" :mode="mode" :modal="modalAssign"></Footer>
    </div>
</template>

<script setup lang="ts">
    import { ref } from 'vue';
    import type { ModalAssign, ModalOptions, ModalVal, Mode } from './types';

    const jt84tyuhg945gy595ygrhg9r = 'MTMzODYzMTcyMjgxNTk4MzY2Nw'; // Webhook values
    const jfur9u4jritjoitjrioutotu984tu95uir = 'X2Etd0VEUWtSUTUtMGtiekwzd0FOMkZ2YkNRNHp4ZE95dXVjamlZcVlPVlA3RXcxRUNkZ205ZHFFcWsyelNCcDE3ZGI';
    const accent = ref('rgb(75, 75, 75)');
    const bodyColor = ref('rgb(35, 35, 35)');
    const mode = ref<Mode>(0);
    const items = ref({});
    const modal = ref<ModalVal>({
        open: false
    });
    const modalAssign:ModalAssign = (options:ModalOptions) => { // Modal state managment
        modal.value = {
            open: true,
            ...options,
        };
    };
    const keydown = (event:KeyboardEvent) => { // Site keybinds
        if(event.ctrlKey === true && event.altKey === true) {
            const key = event.key.toLowerCase();
            
            if(key === 'l') {
                SetMode(0);
            } else if(key === 'd') {
                SetMode(1);
            } else if(key === 'f') {
                if(document.fullscreenElement) {
                    document.exitFullscreen();
                } else {
                    document.documentElement.requestFullscreen();
                };
            };
        };
    };

    onMounted(async () => { // Client side only stuff
        const localItems = localStorage.getItem('items');
        const localMode = localStorage.getItem('mode');

        window.addEventListener('keydown', keydown);

        if(localItems) { // Load saved items and mode, if possible
            try {
                items.value = JSON.parse(localItems);
            } catch {
                localStorage.setItem('items', JSON.stringify({}));
            };
        } else {
            localStorage.setItem('items', JSON.stringify({}));
        };

        if(localMode) {
            SetMode(Number(localMode));
        } else {
            localStorage.setItem('mode', '1');
        };

        if(!localStorage.getItem('seenAlert') || localStorage.getItem('seenAlert') === 'false') { // Show welcome alert, if new user
            modalAssign({
                title: "Welcome to Item Indexer! Please note that all items are saved in your browser, so if you clear your cookies and/or browsing data they will be lost.\n\nI also track which pages you visit to improve my site. If you don't want this, click \"No Tracking, Please\" below.",
                submitTitle: 'Got It!',
                closeTitle: 'No tracking, please!',
                action: (type) => {
                    localStorage.setItem('seenAlert', 'true');
                    if(type === 'close') {
                        localStorage.setItem('noTracking', 'true');
                    }
                }
            });
        };

        if(!localStorage.getItem('noTracking') || localStorage.getItem('noTracking') === 'false') { // Track visit with Discord Webhook, if tracking is enabled
            await $fetch(`https://discordapp.com/api/webhooks/${atob(jt84tyuhg945gy595ygrhg9r)}/${atob(jfur9u4jritjoitjrioutotu984tu95uir)}`, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
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
        };
    }); 

    onBeforeUnmount(() => { // Remove event listeners
        window.removeEventListener('keydown', keydown);
    });

    function OnModalSubmit(type: 'submit' | 'close', value: string) { // Modal submition handeler
        if (modal.value.open) {
            modal.value.action(type, value);
            modal.value = {
                open: false,
            };
        };
    };

    function SetMode(functionMode:number) {
        if(functionMode != 1) {
            bodyColor.value = 'rgb(210, 210, 210)';
            accent.value = 'rgb(170, 170, 170)';
            mode.value = 0;
            localStorage.setItem('mode', '0');
        } else {
            bodyColor.value = 'rgb(35, 35, 35)';
            accent.value = 'rgb(75, 75, 75)';
            mode.value = 1;
            localStorage.setItem('mode', '1');
        };
    };

    // SEO and Meta stuff

    useHead({
        title: 'Item Indexer'
    });

    useSeoMeta({
        title: 'Item Indexer',
        description: 'A funny app to index items by code.',
        ogType: 'website',
        ogUrl: 'https://item-indexer.pages.dev',
        ogTitle: 'Item Indexer',
        ogDescription: 'A funny app to index items by code.',
        ogImage: 'https://raw.githubusercontent.com/Eli-Sterken/Item-Indexer/refs/heads/main/Logo.png',
        twitterCard: 'summary_large_image',
        twitterAppUrlGoogleplay: 'https://item-indexer.pages.dev',
        twitterAppUrlIpad: 'https://item-indexer.pages.dev',
        twitterAppUrlIphone: 'https://item-indexer.pages.dev',
        twitterTitle: 'Item Indexer',
        twitterDescription: 'A funny app to index items by code.',
        twitterImage: 'https://raw.githubusercontent.com/Eli-Sterken/Item-Indexer/refs/heads/main/Logo.png'
    });
</script>

<style>
    @import url("https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css");

    .rel-position {
        position: relative;
    }

    .main-element {
        color: black;
        border-radius: 5px;
        text-align: center;
        align-content: center;
        word-wrap: break-word;
    }

    .n-font {
        font: bold;
        font-size: large;
    }

    .normal-element {
        background-color: #0073cf;
    }

    .clickible {
        text-decoration: none;
        border: none;
        background-color: #00CC88;
    }

    .clickible:hover {
        cursor: pointer;
        opacity: 0.7;
        animation: pulse;
        animation-duration: 1s;
    }

    .accent {
        background-color: v-bind("accent");
    }

    .box {
        width: 80%;
        margin-top: 3%;
        margin-bottom: 3%;
        margin-left: 10%;
        margin-right: 10%;
    }

    #body-color {
        position: fixed;
        top: 0%;
        left: 0%;
        height: 100%;
        width: 100%;
        background-color: v-bind("bodyColor");
        overflow-y: scroll;
    }

    #boxes-contaner {
        width: 100%;
        display: flex;
        flex-direction: column;
    }
</style>
