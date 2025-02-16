<template>
    <h3 class="main-element rel-position normal-element">All Items</h3>
    <h4 class="main-element rel-position normal-element">View, edit, or delete all your items here!</h4>
    <div class="rel-position" id="items-contaner" v-for="item in items" :key="item">
        <div class="main-element rel-position normal-element item" :id="Key(item)">
            <p class="main-element rel-position n-font">Item {{ Key(item) }} - {{ item }}</p>
            <div class="rel-position item-buttons">
                <button class="main-element rel-position clickible n-font item-button" type="button" @click="Edit(Key(item), 0)">Edit Item {{ Key(item) }}s Code</button>
                <button class="main-element rel-position clickible n-font item-button" type="button" @click="Edit(Key(item), 1)">Edit Item {{ Key(item) }}s Description</button>
                <button class="main-element rel-position clickible n-font item-button" type="button" @click="Delete(Key(item))">Delete Item {{ Key(item) }}</button>
            </div>
        </div>
    </div>
    <button class="main-element rel-position clickible n-font" id="clear-button" type="button" @click="Clear">Clear All Items</button>
</template>

<script setup lang="ts">
    type EditType = 0 | 1;

    import { assign } from 'lodash';
    import type { PropType } from 'vue';
    import type { Items, ModalAssign } from '~/types';

    const props = defineProps({
        items: {type: Object as PropType<Items>, required: true},
        modal: {type: Function as PropType<ModalAssign>, required: true}
    });

    function Edit(item:string, type: EditType) { // Edits an item
        const message = type === 0 ? 'Code' : 'Description'
        props.modal({
            title: `Edit item ${item}s ${message}`,
            input: {
                type: type === 0 ? 'number' : 'text',
                placeholder: `New Item ${message}`
            },
            submitTitle: "Save",
            closeTitle: "Cancel",
            action: (actionType, value) => {
                if(actionType === 'submit') {
                    if(type === 0) {
                        if(value in props.items) {
                            setTimeout(props.modal, 0.00000000001, {
                                title: `Item ${value} already exists, are you sure you want to replace it?`,
                                submitTitle: "Yes",
                                closeTitle: "No",
                                action: (actionType0) => {
                                    if(actionType0 === 'submit') {
                                        FinalizeCodeEdit(item, value)
                                    };
                                }
                            });
                        } else {
                            FinalizeCodeEdit(item, value);
                        };
                    } else {
                        props.items[item] = value;
                        localStorage.setItem('items', JSON.stringify(props.items))
                    };
                };
            }
        });
    };

    function FinalizeCodeEdit(item:string, value:string) { // Actualy edits the code for an item
        const description = props.items[item]
        delete props.items[item];
        assign(props.items, {[value]:description});
        localStorage.setItem('items', JSON.stringify(props.items));
    };

    function Delete(item:string) { // Deletes an item
        props.modal({
            title: `Are you sure you want to delete item ${item}?`,
            submitTitle: "Yes",
            closeTitle: "No",
            action: (type) => {
                if(type === 'submit') {
                    delete props.items[item];
                    localStorage.setItem('items', JSON.stringify(props.items));
                };
            }
        });
    };

    function Clear() { // Deletes all items
        props.modal({
            title: "Are you sure you want to delete all items?",
            submitTitle: "Yes",
            closeTitle: "No",
            action: (type) => {
                if(type === 'submit') {
                    for(const item in props.items) {
                        delete props.items[item];
                    };
                    localStorage.setItem('items', JSON.stringify({}));
                }
            }
        });
    };

    function Key(value:string):string { // Returns item key from value
        return Object.keys(props.items).find(key => props.items[key] === value) as string
    };
</script>

<style scoped>
    .item {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        margin-top: 2%;
        margin-bottom: 2%;
    }

    .item-buttons {
        display: flex;
        justify-content: center;
        flex-direction: row;
    }

    .item-button {
        width: 20%;
        margin-left: 2%;
        margin-right: 2%;
    }

    #items-contaner {
        width: 100%;
        display: flex;
        flex-direction: column;
    }

    #clear-button {
        width: 20%;
    }
</style>