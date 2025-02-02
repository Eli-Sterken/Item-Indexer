<template>
    <h1 class="rel-position main-element header">Welcome To Item Indexer!</h1>
    <h2 class="rel-position main-element header">To start using Item Indexer, add an item with a code and description
        below. Then search by code, and you will see the description</h2>
    <div class="rel-position" id="boxesContaner">
        <Search :items="items"></Search>
        <Add :items="items" :modal="modalAssign"></Add>
        <Items :items="items" :modal="modalAssign"></Items>
        <Modal v-if="modal.open" :title="modal.title" :submit-title="modal.submitTitle" :close-title="modal.closeTitle"
            :input="modal.input" @submit="OnModalSubmit"></Modal>
        <Footer></Footer>   
    </div>

</template>

<script setup lang="ts">
import { ref } from 'vue';
import type { DialogInput, ModalAssign, ModalOptions, ModalVal } from './types';

const accent = ref('rgb(75, 75, 75)');
let mode:string;
const items = ref({});
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

onMounted(() => {
    mode = localStorage.getItem('mode') as string;

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

    if (mode != null) { // Load saved mode if possible
        SetMode(Number(mode));
    } else {
        SetMode(1);
    };
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

function SetMode(mode: number): void { // Function to set mode
    if (mode != 1) {
        document.body.style.backgroundColor = 'white';
        accent.value = 'rgb(200, 200, 200)';
        localStorage.setItem('mode', '0');
    } else {
        document.body.style.backgroundColor = 'rgb(35, 35, 35)';
        accent.value = 'rgb(75, 75, 75)';
        localStorage.setItem('mode', '1');
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
.rel-position {
    position: relative;
}

.absPosition {
    position: absolute;
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