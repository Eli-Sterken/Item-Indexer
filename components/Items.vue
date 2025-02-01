<template>
    <div class="box rel-position accent">
        <h3 class="main-element rel-position header">All Items</h3>
        <h4 class="main-element rel-position header">View, edit, or delete all your items here!</h4>
        <div id="items-contaner" v-for="(item, key) in items" :key="key">
            <div class="main-element rel-position item" :id="key">
                <span>
                    <p class="n-font">Item {{ key }} - {{ item }}</p>
                    <button class="main-element n-font clickible item-button" type="button"
                        @click="DeleteItem(key)">Delete Item {{ key }}</button>
                    <button class="main-element n-font clickible item-button" type="button" @click="EditItem(key)">Edit
                        Item {{ key }}</button>
                </span>
            </div>
        </div>
        <div id="clear-contaner">
            <button class="main-element rel-position n-font clickible" id="clear-button" type="button" @click="clear">Clear All Items</button>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { ModalAssign } from '@/types';
import type { PropType } from 'vue';

interface AnyObject {
    [key: string]: any
};

const props = defineProps({
    items: { type: Object, required: true },
    modal: {
        type: Function as PropType<ModalAssign>,
        required: true
    }
});
delete props.items.value

function DeleteItem(item: string): void {
    props.modal({
        title: `Are you sure you want to delete item ${item}?`,
        submitTitle: "Yes",
        closeTitle: "No",
        action: (type) => {
            if (type === 'submit') {
                delete props.items[item];
                localStorage.setItem('items', JSON.stringify(props.items));
            };
        }
    });
};

function EditItem(item: string): void {
    props.modal({
        title: `Edit Item ${item}`,
        submitTitle: "Save",
        closeTitle: "Cancel",
        input: { type: 'text', placeholder: 'New Item Text' },
        action: (type, value) => {
            if (type === 'submit') { 
                props.items[item] = value;
                localStorage.setItem('items', JSON.stringify(props.items));
            };
        }
    });
};

function clear() {
    props.modal({
        title: "Are you sure you want to delete all items?",
        submitTitle: "Yes",
        closeTitle: "No",
        action: (type) => {
            if(type === 'submit') {
                for(const item in props.items) {
                    delete props.items[item];
                };
            };
        }
    });
};
</script>

<style scoped>
.item {
    width: 100%;
    height: fit-content;
    margin-bottom: 2%;
}

.item-button {
    background-color: #0b579e;
    width: fit-content;
    height: fit-content;
}

#items-contaner {
    width: 100%;
    height: fit-content;
    display: flex;
    flex-direction: column;
    align-items: center;
}

#clear-contaner {
    width: 100%;
    display: flex;
    justify-content: center;
}

#clear-button {
    width: 20%;
    height: fit-content;
}
</style>